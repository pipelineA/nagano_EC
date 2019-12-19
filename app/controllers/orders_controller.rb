class OrdersController < ApplicationController
before_action :authenticate_user
  def authenticate_user
    if current_user == nil
       redirect_to new_user_session_path
  end
end

  def new
    @cart_items = current_user.cart_items
    unless @cart_items.any?
       flash.now[:danger] = 'カートは空です'
       render 'carts/index'
    end
    @order = Order.new
    @user = User.all
    @main_address = current_user.addresses.find_by(is_main_address: true)
    @addresses = current_user.addresses.where(is_main_address: false)
  end

  def confirm
    @order = current_user.orders.build(order_params)
    @cart_items = current_user.cart_items
    @main_address = current_user.addresses.find_by(is_main_address: true)
    if params[:order][:address_type] == "address1"
      main_address = current_user.addresses.find_by(is_main_address: true)
      @order.ordered_address = main_address.address
      @order.ordered_postal_code = main_address.postal_code
      @order.ordered_receiver_name = main_address.receiver_name
    elsif params[:order][:address_type] == "address2"
      if params[:order][:address_id]
        selected_address = Address.find(params[:order][:address_id])
        @order.ordered_address = selected_address.address
        @order.ordered_postal_code = selected_address.postal_code
        @order.ordered_receiver_name = selected_address.receiver_name
      end
    elsif params[:order][:address_type] == "address3"
    end
    unless @order.valid?
      unless params[:order][:address_type] == "address3"
        @order.ordered_address = nil
        @order.ordered_postal_code = nil
        @order.ordered_receiver_name = nil
      end
      @user = User.all
      @addresses = current_user.addresses.where(is_main_address: false)
      render :new
    end
  end

  def create
    order = current_user.orders.build(order_params)
    address = current_user.addresses.find_by(postal_code: order.ordered_postal_code, address: order.ordered_address, receiver_name: order.ordered_receiver_name)
    order.save

      unless address
         new_address = current_user.addresses.build(postal_code: order.ordered_postal_code, address: order.ordered_address, receiver_name: order.ordered_receiver_name, is_main_address: false )
         new_address.save
      end
    cart_items = current_user.cart_items
    cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
    @orders = current_user.orders.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :fee, :payment_method, :tax_rate,
                                  :order_status, :ordered_receiver_name, :ordered_postal_code,
                                  :ordered_address, :billing_amount, :address_type, :address_id,
                                  order_items_attributes: [:id, :item_id, :order_id, :item_count, :ordered_price, :ordered_item_name])
  end

  def address_params
  params.require(:address).permit(:postal_code, :address, :receiver_name)
  end

  
end
