require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { FactoryBot.create(:user) }

  subject do
    described_class.new(
      name: 'Test Recipe',
      preparation_time: 10,
      cooking_time: 20,
      description: 'A test recipe',
      user:
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a preparation time' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a cooking time' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'belongs to a user' do
    expect(subject.user).to eq(user)
  end

  it 'has many recipe_foods' do
    expect(subject.recipe_foods).to eq([])
  end

  it 'has many foods through recipe_foods' do
    expect(subject.foods).to eq([])
  end
end
