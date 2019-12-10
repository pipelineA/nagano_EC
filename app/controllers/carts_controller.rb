class CartsController < ApplicationController
  def index
  	@cart_items = current_user.cart_items
  end

  def create
    if current_user == nil
      redirect_to user_session_path
    else
  	cart_item = current_user.cart_items.build(cart_item_params)
  	cart_item.user_id = current_user.id
  	cart_item.save
  	redirect_to carts_path
    end
  end

  def update
  @cart_item = CartItem.find(params[:id])
  @cart_item.item_count += params[:cart_item][:item_count].to_i
  @cart_item.save
  redirect_to carts_path
  end

  def destroy_all
    @cart_items = current_user.cart_items
    @cart_items.destroy_all
    redirect_to carts_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:user_id, :item_id, :item_count)
  end

end