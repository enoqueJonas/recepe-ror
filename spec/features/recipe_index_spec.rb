require 'rails_helper'

RSpec.describe 'Recipes index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:recipe1) { FactoryBot.create(:recipe, name: 'Recipe 1', user:) }
  let!(:recipe2) { FactoryBot.create(:recipe, name: 'Recipe 2', user:) }

  before do
    sign_in user
    visit recipes_path
  end

  it 'displays recipe names and descriptions and remove button actions' do
    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe1.description)
    expect(page).to have_content(recipe2.name)
    expect(page).to have_content(recipe2.description)
    click_on 'Remove', match: :first
    expect(page).to have_content('Recipe was successfully destroyed.')
    expect(page).not_to have_content(recipe1.name)
  end
end
