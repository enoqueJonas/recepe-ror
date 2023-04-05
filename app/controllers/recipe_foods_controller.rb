class RecipeFoodsController < ApplicationController
  def index
    recipe = Recipe.find(params[:recipe_id])
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @recipe_food.recipe_id = params[:recipe_id]
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]

    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id]), notice: 'Food added to recipe.'
    else
      redirect_to recipe_recipe_foods_new_path(@recipe), alert: 'Unable to add food to recipe.'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity)
  end
end
