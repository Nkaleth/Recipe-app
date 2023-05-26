class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, class_name: 'Food', foreign_key: 'user_id'
  has_many :recipes, class_name: 'Recipe', foreign_key: 'user_id'

  def shopping_list
    # Get the user's food list as a hash list with id as a key and quantity as a value
    user_foods = foods.pluck(:id, :quantity).to_h
    # Get all the recipe_foods from all recipes that belong to the user
    recipe_foods = RecipeFood.joins(:recipe).where(recipes: { user_id: id }).group(:food_id).sum(:quantity)
    # Calculating the difference in quantity for each food
    difference = {}
    (user_foods.keys + recipe_foods.keys).uniq.each do |food_id|
      difference[food_id] = recipe_foods[food_id].to_i - user_foods[food_id].to_i
    end
    # Get the foods name indexed by id
    foods = Food.where(id: difference.keys).index_by(&:id)
    # Build the result table
    result = []
    difference.each do |food_id, quantity_difference|
      next if quantity_difference.negative? # Skip foods with a negative quantity_difference value

      food = foods[food_id]
      result << {
        name: food.name,
        quantity: quantity_difference,
        price: food.price * quantity_difference, # Calculate the price for this food
        measurement_unit: food.measurement_unit
      }
    end
    result
  end
end
