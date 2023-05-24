class FoodsController < ApplicationController
  def index
    puts @user_foods = current_user.foods
  end
end
