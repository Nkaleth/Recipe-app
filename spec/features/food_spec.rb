require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  before do
    # Create a user and sign in
    user = User.create!(name: 'Tom', user_avatar: '/assets/user_avatar-svgrepo-com.svg', email: 'tom@email.com',
                        password: '123456')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit user_foods_path(user)
  end

  scenario 'User can see their foods' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Unit Price')
  end

  scenario 'User can add a new food' do
    click_link 'Add Food'
    fill_in 'Name', with: 'Apple'
    fill_in 'Price', with: 2.99
    click_button 'Create Food'
    expect(page).to have_content('Apple')
  end

  scenario 'User can delete a food' do
    # Create a food for the user
    user = User.find_by(email: 'tom@email.com')
    food = Food.create!(name: 'Apple', price: 2.99, user:)
    visit user_foods_path(user)
    within("#food_#{food.id}") { click_button 'Delete' }
    expect(page).not_to have_content(food.name)
  end
end
