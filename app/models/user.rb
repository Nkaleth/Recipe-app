class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, class_name: 'Food', foreign_key: 'user_id'
  has_many :recipes, class_name: 'Recipe', foreign_key: 'user_id'

  def shopping_list(recipe)
    # Get the user's food list as a hash list with id as a key and quantity as a value
    user_foods = foods.pluck(:id, :quantity).to_h
    # Get the recipe's recipe_foods as a hash list
    recipe_foods = recipe.recipe_foods.pluck(:food_id, :quantity).to_h
    # Calculating the difference in quantity for each food
    difference = {}
    (user_foods.keys + recipe_foods.keys).uniq.each do |food_id|
      difference[food_id] = recipe_foods[food_id].to_i - user_foods[food_id].to_i
    end
    # Get the foods name indexed by id
    foods = Food.where(id: difference.keys).order(:name)
    # Build the result table
    result = []
    difference.each do |food_id, quantity_difference|
      food = foods[food_id]
      result << {
        name: food.name,
        quantity: quantity_difference,
        price: food.price * quantity_difference
      }
    end
  end
end
