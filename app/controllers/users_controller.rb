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
  			@user.update(user_params)
    	  redirect_to user_path(@user.id)
    	end
  end

  private
  def user_params
  	params.require(:user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :phone_number, :email, :is_unsubscribe, addresses_attributes: [:id, :postal_code, :address])
  end
end