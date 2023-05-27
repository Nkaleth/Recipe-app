class PagesController < ApplicationController
  def general_shopping_list
    @list = current_user.shopping_list
    @count = @list.size # Calculate the count of foods
    @total_price = @list.sum { |food| food[:price] } # Calculate the total price of all foods
  end

  def public_recipes
    puts 'Here should be a method'
  end
end
