class FoodsController < ApplicationController
  def index
    puts @user_foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)

    if @food.save
      redirect_to user_foods_path
    else
      flash.now[:error] = 'There was an error with your input. Please check your data and try again.'
      render 'new'
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])

    @food.destroy
    redirect_to user_foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
