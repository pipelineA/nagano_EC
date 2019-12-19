class Admin::OrdersController < AdminController
  def index
    if params[:user_id]
      @order_user = User.find(params[:user_id])
      @orders = @order_user.orders.page(params[:page]).per(15).order(created_at: :desc)
    elsif params[:order_status]
      @status = params[:order_status]
      @orders = Order.where(order_status: @status).page(params[:page]).per(15).order(created_at: :desc)
    elsif params[:making_status]
      @status = params[:making_status]
      case @status
      when "製作待ち"
        number = 0
      when "製作中"
        number = 1
      when "製作完了"
        number = 2
      end
      @orders = Order.joins(:order_items).where(['order_items.making_status = ?', "#{number}"]).distinct.page(params[:page]).per(15).order(created_at: :desc)
    else
      @orders = Order.page(params[:page]).per(15).order(created_at: :desc)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:success] = "注文ステータスを更新しました"
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status, order_items_attributes: [:making_status, :id])
  end

end

