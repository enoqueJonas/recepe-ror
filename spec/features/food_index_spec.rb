require 'rails_helper'

RSpec.describe 'Food index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:food1) { FactoryBot.create(:food, name: 'Apple', user:) }
  let!(:food2) { FactoryBot.create(:food, name: 'Orange', user:) }

  before do
    sign_in user
    visit foods_path
  end

  it 'displays food names and quantities' do
    expect(page).to have_content(food1.name)
    expect(page).to have_content(food1.quantity)
    expect(page).to have_content(food2.name)
    expect(page).to have_content(food2.quantity)
    click_on 'Add Food', match: :first
    expect(page).to have_content('Name')
  end
end
