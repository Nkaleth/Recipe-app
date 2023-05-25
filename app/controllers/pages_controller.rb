class PagesController < ApplicationController
  def general_shopping_list
    @recipes = current_user.recipes
    @foods = current_user.foods
  end

  def public_recipes
    puts 'Here should be a method'
  end
end
