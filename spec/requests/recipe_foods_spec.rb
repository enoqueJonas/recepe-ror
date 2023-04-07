require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  let(:user) { FactoryBot.create(:user, email: 'test@example.com') }
  let(:food) { FactoryBot.create(:food, user:) }
  let(:recipe) { FactoryBot.create(:recipe, user:) }

  describe 'GET #index' do
    it 'returns a success response' do
      get recipes_path
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    before { get new_recipe_recipe_food_path(recipe_id: recipe.id) }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
    it 'assigns a new recipe_food object' do
      expect(assigns(:recipe_food)).to be_a_new(RecipeFood)
    end

    it 'assigns the requested recipe to @recipe' do
      expect(assigns(:recipe)).to eq recipe
    end
  end
end
