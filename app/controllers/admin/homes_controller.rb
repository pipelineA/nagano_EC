class Admin::HomesController < AdminController
  def top
    @new_orders = Order.where('created_at >= ?', Date.today)
    @new_users = User.where('created_at >= ?', Date.today)
  end
end
