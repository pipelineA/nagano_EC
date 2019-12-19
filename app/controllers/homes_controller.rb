class HomesController < ApplicationController
  def top
  	@genres = Genre.where(is_active: true)
  	if params[:genre_id]
  		@genre = Genre.find(params[:genre_id])
  		@items = @genre.items.where(item_status: "販売中").page(params[:page]).per(12)
  	elsif params[:search]
      @search = params[:search]
      @items = Item.where(['name LIKE ? OR description LIKE ?', "%#{@search}%", "%#{@search}%"]).where(item_status: "販売中").page(params[:page]).per(12)
    elsif params[:price]
      @price0 = params[:price][0].to_i
      @price1 = params[:price][1].to_i
      @items = Item.where(["price >= ? AND price <= ?", @price0, @price1]).where(item_status: "販売中").page(params[:page]).per(12)
    else
       @items = Item.where(item_status: "販売中").page(params[:page]).per(12)
    end

  end

  def about
  end
  private
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @items = Item.search(params[:search])
  end
end
