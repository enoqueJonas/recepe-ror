class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was successfully destroyed.'
    else
      redirect_to recipes_path, notice: 'You are not authorized to delete this recipe.'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: params[:public])
    redirect_to @recipe
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public?)
    redirect_to @recipe
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
