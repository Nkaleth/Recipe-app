require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'associations' do
    it 'belongs to recipe' do
      recipe = Recipe.new
      recipe_food = RecipeFood.new(recipe:)
      expect(recipe_food.recipe).to eq(recipe)
    end

    it 'belongs to food' do
      food = Food.new
      recipe_food = RecipeFood.new(food:)
      expect(recipe_food.food).to eq(food)
    end
  end
end
