class Food < ApplicationRecord
  validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'food_id', dependent: :destroy
  belongs_to :user, class_name: 'User'
end
