class  PublicRecipesController < ApplicationController
    def index
        @recipes = Recipe.where(public: true)
        @users = User.all
        @recipe_foods = RecipeFood.all
    end

    def show

    end
end