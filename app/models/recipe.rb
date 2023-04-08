class Recipe < ApplicationRecord
  belongs_to :user

  def user_name
    user.name
  end

  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  def total_price
    total = 0
    recipe_foods.each do |rf|
      food = Food.find(rf.food_id)
      total += (rf.quantity * food.price)
    end
    total
  end

  def total_quantity
    qt = 0
    recipe_foods.each do |rf|
      qt += rf.quantity if rf.recipe_id == id
    end
    qt
  end

  validates :name, :preparation_time, :cooking_time, :description, presence: true
end
