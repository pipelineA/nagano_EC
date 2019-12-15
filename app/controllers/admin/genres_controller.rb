class Admin::GenresController < AdminController

  def index
    @genres = Genre.page(params[:page]).per(15)
    @new_genre = Genre.new
  end

  def create
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      flash[:success] = "新しいジャンルを追加しました"
      redirect_to admin_genres_path
    else
      @genres = Genre.page(params[:page]).per(15)
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if params[:invalidate]
      @genre.update(is_active: false)
    elsif params[:validate]
      @genre.update(is_active: true)
    elsif params[:update_name]
      unless @genre.update(genre_params)
        @genres = Genre.page(params[:page]).per(15)
        @new_genre = Genre.new
        render :index and return
      end
    end
    flash[:success] = "ジャンル情報を変更しました"
    redirect_to admin_genres_path
  end

private
  def genre_params
  params.require(:genre).permit(:name)
end

end