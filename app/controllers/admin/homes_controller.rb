class Admin::HomesController < AdminController
  def top
    Order.where(:created_at.to_date => Date.today)
  end
end
