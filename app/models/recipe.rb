class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'recipe_id'

  validates :name, presence: true, length: { in: 2..250 }
  validates :description, presence: true
  validates :prep_time, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :cook_time, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end
