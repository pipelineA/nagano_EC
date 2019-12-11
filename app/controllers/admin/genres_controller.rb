class Admin::GenresController < AdminController
  
  def index
  @genres = Genre.all
  @genre = Genre.new
  end
  
  def create
  @genre = Genre.new(genre_params)
  @genre.savet 
  redirect_to admin_genres_path
  end
  
  def update
    @genre = Genre.find(params[:id])
    if params[:invalidate]
      @genre.update(is_active: false)
    elsif params[:validate]
      @genre.update(is_active: true)
    elsif params[:update_name]
      @genre.update(genre_params)
    end
    redirect_to admin_genres_path
  
  end

private
  def genre_params
  params.require(:genre).permit(:name)
end

end