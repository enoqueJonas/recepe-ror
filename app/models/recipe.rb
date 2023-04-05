class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  def user_name
    user.name
  end
  
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
end
