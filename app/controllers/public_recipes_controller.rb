class PublicRecipesController < ApplicationController
  
  def index
    @user = current_user
    @users = User.all
    @public_recipes = Recipe.includes(%i[recipe_foods user]).where(public: true).order(created_at: :desc)
  end
end
