class ItemsController < ApplicationController
  def show
  	@genres = Genre.all
  	@item = Item.find(params[:id])

  	if current_user.cart_items.find_by(item_id: @item.id)
  	@cart_item = current_user.cart_items.find_by(item_id: @item.id)
  	@url = cart_path(@cart_item.id)
	else
  	@cart_item = CartItem.new
  	@url = carts_path
    end
  end
end
