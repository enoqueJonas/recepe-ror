require 'rails_helper'

RSpec.describe 'Recipes new page', type: :feature do
  include Capybara::DSL

  let(:user) { FactoryBot.create(:user) }

  it 'Shows new page form' do
    visit '/recipes/new'
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Cooking time')
  end
end
