class OrdersController < ApplicationController
  def new
    @order = Order.new
    @user = User.all
    @address = Address.new
    @main_address = current_user.addresses.find_by(is_main_address: true)
    @addresses = current_user.addresses.where(is_main_address: false)

  end

  def confirm
    @order = Order.new(order_params)
    if params[:address1]
      main_address = current_user.addresses.find_by(is_main_address: true)
      @order.ordered_address = main_address.ordered_address
      @order.ordered_postal_code = main_address.ordered_postal_code
      @order.ordered_receiver_name = main_address.ordered_receiver_name
    elsif
      params[:address2]
    else
      params[:address3]
    end
    @cart_items = current_user.cart_items
    @main_address = current_user.addresses.find_by(is_main_address: true)
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :fee, :payment_method, :tax_rate,
                                  :oreder_status, :ordered_receiver_name, :ordered_postal_code,
                                  :ordered_address, :billing_amount)

  end
end
