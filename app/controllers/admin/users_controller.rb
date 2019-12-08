class Admin::UsersController < AdminController
  def index
    @users = User.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

end