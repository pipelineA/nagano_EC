class Admin::ItemsController < AdminController
  def index
    if params[:search]
      @search = params[:search]
      if genre = Genre.find_by(name: @search)
        genre_id = genre.id
      else
        genre_id = ""
      end
      @items = Item.where(['name LIKE ? OR description LIKE ? OR price LIKE ? OR genre_id = ?', "%#{@search}%", "%#{@search}%", "%#{@search}%", "#{genre_id}"]).page(params[:page]).per(15)
    else
      @items = Item.page(params[:page]).per(15)
    end
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "新規商品が追加されました"
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render :new
    end
  end

  def show
    @item =Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

    def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    flash[:success] = "商品情報が変更されました"
      redirect_to admin_item_path @item
    else
      @genres = Genre.all
      render :edit
    end
  end



  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :genre_id, :item_status)
  end
end
