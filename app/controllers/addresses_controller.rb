class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses
    @address = Address.new
  end
  def create
    @address = current_user.addresses.build(address_params)
    @address.is_main_address = false
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
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
