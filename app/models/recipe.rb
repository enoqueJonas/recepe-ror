class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  def user_name
    user.name
  end
end
