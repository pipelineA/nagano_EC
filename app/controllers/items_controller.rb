class ItemsController < ApplicationController
  def show
  	@genres = Genre.all
  	@item = Item.find(params[:id])
  	@cart = CartItem.new
  end
end
