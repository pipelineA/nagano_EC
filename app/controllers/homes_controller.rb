class HomesController < ApplicationController
  def top
  	@genres = Genre.all
  	if params[:genre_id]
  		# @items = Item.where(genre_id: params[:genre_id])
  		@genre = Genre.find(params[:genre_id])
  		@items = @genre.items.page(params[:page]).per(9)
  	elsif params[:search]
      @search = params[:search]
      @items = Item.where(['name LIKE ? OR description LIKE ?', "%#{@search}%", "%#{@search}%"]).page(params[:page]).per(9)
    else
       @items = Item.page(params[:page]).per(9)
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
