class Admin::UsersController < AdminController
  def index
    @users = User.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
    @user_address = @user.addresses.find_by(is_main_address: true)
  end

  def edit
    @user = User.find(params[:id])
    @user_address = @user.addresses.find_by(is_main_address: true)
  end

  def update
    @user = User.find(params[:id])
      if params[:unsubscribe]
        @user.update(is_unsubscribe: true)
        redirect_to admin_user_path(@user)
      else
        if @user.update(user_params)
          redirect_to admin_user_path(@user.id)
          flash[:success] = "ユーザー情報を編集しました"
        else
          @user_address = @user.addresses.find_by(is_main_address: true)
          render :edit
        end
      end
  end

  private
  def user_params
    params.require(:user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :phone_number, :email, addresses_attributes: [:id, :postal_code, :address])
  end

end