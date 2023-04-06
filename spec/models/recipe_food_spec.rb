require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let!(:recipe) { FactoryBot.create(:recipe, user: user) }
  let(:food) { FactoryBot.create(:food, user: user) }

  subject do
    described_class.new(
      quantity: 10,
      recipe_id: recipe.id,
      food_id: food.id
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'belongs to a recipe' do
    expect(subject.recipe).to eq(recipe)
  end

  it 'belongs to a food' do
    expect(subject.food).to eq(food)
  end
end
