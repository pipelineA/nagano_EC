class Admin::HomesController < AdminController
  def top
    @new_orders = Order.where('created_at >= ?', Time.zone.today)
    @new_users = User.where('created_at >= ?', Time.zone.today)
  end
end
