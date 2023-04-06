require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get recipes_path
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:recipe) { FactoryBot.create(:recipe, user:) }

    it 'returns a success response' do
      get recipe_path(recipe)
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get new_recipe_path
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }

    context 'when the user is logged in with valid attributes' do
      before { sign_in user }

      it 'creates a new recipe' do
        expect do
          post recipes_path,
               params: { recipe: { name: 'Test Recipe', preparation_time: 10, cooking_time: 20,
                                   description: 'A test recipe', public: true } }
        end.to change(Recipe, :count).by(1)
      end

      it 'redirects to the recipes index page' do
        post recipes_path,
             params: { recipe: { name: 'Test Recipe', preparation_time: 10, cooking_time: 20,
                                 description: 'A test recipe', public: true } }
        expect(response).to redirect_to(recipes_path)
      end

      it 'sets the user association for the new recipe' do
        post recipes_path,
             params: { recipe: { name: 'Test Recipe', preparation_time: 10, cooking_time: 20,
                                 description: 'A test recipe', public: true } }
        expect(Recipe.last.user).to eq(user)
      end
    end

    context 'when the user is not logged in' do
      it 'redirects to the login page' do
        post recipes_path,
             params: { recipe: { name: 'Test Recipe', preparation_time: 10, cooking_time: 20,
                                 description: 'A test recipe', public: true } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { FactoryBot.create(:user, email: 'test@example.com') }
    let(:recipe) { FactoryBot.create(:recipe, user:) }

    context 'when the user is logged in and owns the recipe' do
      before { sign_in user }

      it 'destroys the requested recipe' do
        delete recipe_path(recipe)
        expect(Recipe.exists?(recipe.id)).to be false
      end

      it 'redirects to the index page' do
        delete recipe_path(recipe)
        expect(response).to redirect_to(recipes_path)
      end
    end

    context 'when the user is logged in but does not own the recipe' do
      let(:other_user) { FactoryBot.create(:user) }
      before { sign_in other_user }

      it 'does not destroy the requested recipe' do
        delete recipe_path(recipe)
        expect(Recipe.exists?(recipe.id)).to be true
      end

      it 'redirects to the index page' do
        delete recipe_path(recipe)
        expect(response).to redirect_to(recipes_path)
      end

      it 'displays an error message' do
        delete recipe_path(recipe)
        expect(flash[:notice]).to eq('You are not authorized to delete this recipe.')
      end
    end

    context 'when the user is not logged in' do
      it 'does not destroy the requested recipe' do
        delete recipe_path(recipe)
        expect(Recipe.exists?(recipe.id)).to be true
      end
    end
  end
end
