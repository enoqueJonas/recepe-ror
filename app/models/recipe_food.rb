class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def recipe_id
    recipe.id
  end

  def total_price
    food.quantity * food.price
  end
end
