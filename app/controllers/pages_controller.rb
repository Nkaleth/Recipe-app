class PagesController < ApplicationController
  def general_shopping_list
    @recipe = Recipe.includes(:recipe_foods).find(params[:recipe_id])
    @foods = current_user.foods
  end

  def public_recipes
    puts 'Here should be a method'
  end
end
