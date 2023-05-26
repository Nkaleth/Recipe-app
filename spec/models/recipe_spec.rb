require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      recipe = Recipe.new(name: nil)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:name]).to include("can't be blank")
    end

    it 'validates length of name' do
      recipe = Recipe.new(name: 'a' * 251)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:name]).to include('is too long (maximum is 250 characters)')
    end

    it 'validates presence of description' do
      recipe = Recipe.new(description: nil)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:description]).to include("can't be blank")
    end

    it 'validates presence of prep_time' do
      recipe = Recipe.new(prep_time: nil)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:prep_time]).to include("can't be blank")
    end

    it 'validates numericality of prep_time' do
      recipe = Recipe.new(prep_time: -1.0)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:prep_time]).to include('must be greater than or equal to 0')
    end

    it 'validates presence of cook_time' do
      recipe = Recipe.new(cook_time: nil)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:cook_time]).to include("can't be blank")
    end

    it 'validates numericality of cook_time' do
      recipe = Recipe.new(cook_time: -1.0)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:cook_time]).to include('must be greater than or equal to 0')
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      user = User.new
      recipe = Recipe.new(user: user)
      expect(recipe.user).to eq(user)
    end

    it 'has many recipe_foods' do
      recipe = Recipe.new
      recipe_food = RecipeFood.new
      recipe.recipe_foods << recipe_food
      expect(recipe.recipe_foods).to include(recipe_food)
    end
  end
end
