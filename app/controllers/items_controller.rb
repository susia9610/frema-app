class ItemsController < ApplicationController
  # before_action :move_to_root, except: [:index, :show]
  # before_action :set_item, only: [:show,:edit, :purchase, :done, :destroy]

  def index
    @items = Item.includes(:images).where(status_id: "1").order(created_at: :desc)
  end
  
  def new
    @item = Item.new
    @item.images.new
  end
    
  def create
    @item = Item.new(set_params)
    if @item.save
      render :create, notise: '出品しました'
    else
      flash.now[:alert] = '出品できません。入力必須項目を確認してください'
      render :new
    end
  end
 
  def edit
  end
   
  def update
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除に失敗しました"
    end
  end
  
  def show
    
  end


  private
  def set_params
    params.require(:item).permit(:name, :description, :category_id, :brand, :condition_id, :prefecture_id, :size, :price, :shipping_days_id, :postage_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: "1")
  end

  # def purchase
  # end

  # def move_to_root
  #   redirect_to root_path unless user_signed_in?
  #   flash[:alert] = 'ログインしてください'
  # end

  
  # def set_item
  #   @item = Item.find(params[:id])
  # end 

end
