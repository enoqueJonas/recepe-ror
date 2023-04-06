class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc)
    @users = User.all
    @recipe_foods = RecipeFood.all
  end

  def show; end
end
