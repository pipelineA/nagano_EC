class CartsController < ApplicationController

before_action :authenticate_user
  def authenticate_user
    if current_user == nil
       redirect_to new_user_session_path
  end
end

  def index
  	@cart_items = current_user.cart_items
  end

  def create
    if current_user == nil
      redirect_to user_session_path
    else
  	cart_item = current_user.cart_items.build(cart_item_params)
  	cart_item.user_id = current_user.id
      if cart_item.save
    	   redirect_to carts_path
      else
        flash[:danger] = '個数を選択してください'
        redirect_to item_path(params[:cart_item][:item_id])
      end
    end
  end

  def update
  @cart_item = CartItem.find(params[:id])
    if params[:cartupdate]
      if params[:cart_item][:item_count] == ""
         flash[:danger] = '個数を選択してください'
         redirect_to item_path(params[:cart_item][:item_id])
      else
      @cart_item.item_count += params[:cart_item][:item_count].to_i
      @cart_item.save
      redirect_to carts_path
      end
    else
      @cart_item.update(cart_item_params)
      if @cart_item.item_count == 0
         @cart_item.destroy
      end
      redirect_to carts_path
    end
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