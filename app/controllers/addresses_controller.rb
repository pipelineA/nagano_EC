class AddressesController < ApplicationController

before_action :authenticate_user
  def authenticate_user
    if current_user == nil
       redirect_to new_user_session_path
  end
end

  def index
    @addresses = current_user.addresses.where(is_main_address: false)
    @address = Address.new
  end
  def create
       @address = current_user.addresses.build(address_params)
       @address.is_main_address = false
       if @address.save
          redirect_to addresses_path
    else
       @addresses = current_user.addresses.where(is_main_address: false)
       render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       redirect_to addresses_path
    else
       @addresses = current_user.addresses.where(is_main_address: false)
       render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
private
def address_params
  params.require(:address).permit(:postal_code, :address, :receiver_name)
end
end
