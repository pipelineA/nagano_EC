class OrdersController < ApplicationController
  def new
    @order = Order.new
    @user = User.all
    @address = Address.new
    @main_address = current_user.addresses.find_by(is_main_address: true)
    @addresses = current_user.addresses.where(is_main_address: false)

  end

  def confirm
    @cart_items = current_user.cart_items
    @order = current_user.orders.build(order_params)
    @order.order_items.build
    if params[:order][:address_type] == "address1"
      main_address = current_user.addresses.find_by(is_main_address: true)
      @order.ordered_address = main_address.address
      @order.ordered_postal_code = main_address.postal_code
      @order.ordered_receiver_name = current_user.family_name + " " +current_user.first_name
    elsif params[:order][:address_type] == "address2"
      selected_address = Address.find(params[:order][:address_id])
      @order.ordered_address = selected_address.address
      @order.ordered_postal_code = selected_address.postal_code
      @order.ordered_receiver_name = selected_address.receiver_name
    elsif params[:order][:address_type] == "address3"
    end
  end

  def create
    order = current_user.orders.build(order_params)
    address = current_user.addresses.where(is_main_address: false)
      if order.ordered_receiver_name != address.receiver_name
         @address.is_main_address = false
         @address.save
      end
    order.save
    cart_items = current_user.cart_items
    cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :fee, :payment_method, :tax_rate,
                                  :order_status, :ordered_receiver_name, :ordered_postal_code,
                                  :ordered_address, :billing_amount, 
                                  order_items_attributes: [:id, :item_id, :order_id, :item_count, :ordered_price, :ordered_item_name])

  end
end
