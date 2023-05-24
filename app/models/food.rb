class Food < ApplicationRecord
  validates :price, :quantity, numericality: { greater_than: 0 }
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'food_id'
  belongs_to :user, class_name: 'User'
end
