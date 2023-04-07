require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { FactoryBot.create(:user) }

  subject do
    described_class.new(
      name: 'MyString',
      measurement_unit: 'MyString',
      price: '9.99',
      quantity: '9.99',
      user: user
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a measurement unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'belongs to a user' do
    expect(subject.user).to eq(user)
  end

  it 'has many recipe_foods' do
    expect(subject.recipe_foods).to eq([])
  end
end
