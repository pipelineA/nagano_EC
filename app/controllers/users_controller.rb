class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @main_address = current_user.addresses.find_by(is_main_address: true)
  end

  def edit
  	@user = User.find(params[:id])
   	@main_address = current_user.addresses.find_by(is_main_address: true)
  end

  def update
  	@user = User.find(params[:id])
  		if params[:unsubsuribe]
  		   @user.is_unsubscribe = true
  		   @user.update(user_params)
  		   redirect_to about_path
  		else
  			if @user.update(user_params)
        address = current_user.addresses.find_by(is_main_address: true)
        address.receiver_name = current_user.family_name + " " +current_user.first_name
        address.save
        redirect_to user_path(@user.id)
        else
          @main_address = current_user.addresses.find_by(is_main_address: true)
          @main_address.address = params[:user][:addresses_attributes]["0"][:address]
          @main_address.postal_code = params[:user][:addresses_attributes]["0"][:postal_code]
          render :edit
        end
    	end
  end

  private
  def user_params
  	params.require(:user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :phone_number, :email, :is_unsubscribe, addresses_attributes: [:id, :postal_code, :address, :receiver_name])
  end
end