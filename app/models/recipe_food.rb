class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def recipe_id
    recipe.id
  end
end
