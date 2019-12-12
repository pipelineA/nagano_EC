class Admin::OrdersController < AdminController
  def index
    if params[:user_id]
    @orders = User.find(params[:user_id]).orders
    else
    @orders = Order.all
  end

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status, order_items_attributes: [:making_status, :id])
  end

end
