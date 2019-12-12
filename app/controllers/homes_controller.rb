class HomesController < ApplicationController
  def top
  	@genres = Genre.all
  	if params[:genre_id]
  		# @items = Item.where(genre_id: params[:genre_id])
  		@genre = Genre.find(params[:genre_id])
  		@items = @genre.items
  	else
       @items = Item.all
    end
  end

  def about
  end
end
