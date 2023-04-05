class GeneralShoppingListController < ApplicationController

  def index
    @user = current_user
    @recipes = Recipe.where(user_id: @user.id)
    @foods = Food.where(user_id: @user.id)
    @missing_foods = @foods - @recipes.flat_map(&:foods)
    @total_food_items = @missing_foods.map(&:name).uniq.count
    @total_price = 0
    @missing_foods.each do |food|
      @total_price += food.quantity.to_f * food.price.to_f
    end
  
    @total_price = BigDecimal(@total_price, 2)
  end
end
