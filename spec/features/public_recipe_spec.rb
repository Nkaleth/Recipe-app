require 'rails_helper'

RSpec.describe 'Public Recipes Page', type: :system do
  describe 'Public Recipe /index' do
    before :each do
      @user = User.create!(name: 'koami', email: 'koami@gmail.com', password: 'koamiPassword')
      @recipe = Recipe.create!(name: 'recipe1', prep_time: 1, cook_time: 2, description: 'description for the recipe',
                               public: true, user_id: @user.id)
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'koami@gmail.com'
      fill_in 'user_password', with: 'koamiPassword'
      click_button 'Log in'
      sleep(2)
      visit public_recipes_path
    end

    it 'displays the name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'displays the name of the user' do
      expect(page).to have_content(@user.name)
    end

    it 'displays a button with text Add Recipe' do
      expect(page).to have_content('Add Recipe')
    end

    it 'button redirects to a page to add new recipe' do
      click_link 'Add Recipe'
      expect(page).to have_current_path new_recipe_path
    end
  end
end