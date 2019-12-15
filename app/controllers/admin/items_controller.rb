class Admin::ItemsController < AdminController
  def index
    @items = Item.page(params[:page]).per(15)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "新規商品が追加されました"
      redirect_to admin_items_path
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
    
  end

    def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to   admin_items_path
  end



  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :genre_id)
  end
end
