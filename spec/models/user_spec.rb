require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many foods' do
      user = User.new
      food = Food.new
      user.foods << food
      expect(user.foods).to include(food)
    end

    it 'has many recipes' do
      user = User.new
      recipe = Recipe.new
      user.recipes << recipe
      expect(user.recipes).to include(recipe)
    end
  end

  describe '#shopping_list' do
    let!(:user) do
      User.create!(name: 'Tom', user_avatar: '/assets/user_avatar-svgrepo-com.svg', email: 'tom@email.com',
                   password: '123456')
    end
    let!(:food1) { Food.create!(user:, name: 'Food 1', price: 1.0, quantity: 1) }
    let!(:food2) { Food.create!(user:, name: 'Food 2', price: 2.0, quantity: 2) }
    let!(:recipe1) do
      Recipe.create!(user:, name: 'Recipe 1', description: 'Description', prep_time: 1.0, cook_time: 1.0)
    end
    let!(:recipe2) do
      Recipe.create!(user:, name: 'Recipe 2', description: 'Description', prep_time: 1.0, cook_time: 1.0)
    end

    before do
      RecipeFood.create!(recipe: recipe1, food: food1, quantity: 3)
      RecipeFood.create!(recipe: recipe2, food: food2, quantity: 1)
    end

    it 'returns the correct shopping list' do
      expect(user.shopping_list).to eq([
                                         {
                                           name: food1.name,
                                           quantity: 2,
                                           price: food1.price * 2,
                                           measurement_unit: food1.measurement_unit
                                         }
                                       ])
    end
  end
end
