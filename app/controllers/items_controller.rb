class ItemsController < ApplicationController
  def show
    @newuser = User.new
  	@genres = Genre.where(is_active: true)
  	@item = Item.find(params[:id])
    if current_user == nil
       @cart_item = CartItem.new
       @url = carts_path
  	elsif current_user.cart_items.find_by(item_id: @item.id)
  	@cart_item = current_user.cart_items.find_by(item_id: @item.id)
  	@url = cart_path(@cart_item.id)
	  else
  	@cart_item = CartItem.new
  	@url = carts_path
    end

    if @item.item_status == "販売停止中"
      @item_disabled = true
    else
      @item_disabled = false
    end
  end
end
