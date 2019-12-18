class Admin::HomesController < AdminController
  def top
    @new_orders = Order.where('created_at >= ?', Time.zone.today.beginning_of_day)
    @amount_today = @new_orders.total_amount
    @new_users = User.where('created_at >= ?', Time.zone.today.beginning_of_day)
  end
end
