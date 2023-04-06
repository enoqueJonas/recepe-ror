require 'rails_helper'

RSpec.describe "Foods new page", type: :feature do
  include Capybara::DSL

  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  context 'with valid attributes' do
    it 'creates a new food and redirects to the index page' do
      visit '/foods/new'
      fill_in 'Name', with: 'New Food'
      fill_in 'Measurement unit', with: 'kg'
      fill_in 'Price', with: 9.99
      fill_in 'Quantity', with: 1.5
      click_button 'Submit'

      expect(page).to have_content('Food created succesfully')
      expect(page).to have_content('New Food')
      expect(page).to have_content('kg')
      expect(page).to have_content('9.99')
      expect(page).to have_content('1.5')
    end
  end
end
