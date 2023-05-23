class Food < ApplicationRecord
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'food_id'
  belongs_to :user, class_name: 'User'
end
