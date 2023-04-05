class  PublicRecipesController < ApplicationController
    def index
        @recipes = Recipe.where(public: true)
        @users = User.all
    end

    def show

    end
end