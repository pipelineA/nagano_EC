class OrdersController < ApplicationController
  def new
    @order = Order.new
    @user = User.all
    @address = Address.new
    @main_address = current_user.addresses.find_by(is_main_address: true)
    @addresses = current_user.addresses.where(is_main_address: false)

  end

  def confirm

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
                                  :oreder_status, :ordered_reveiver_name, :ordered_postal_code,
                                  :ordered_address, :billing_amount)
    
  end
end
