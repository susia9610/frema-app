class ItemsController < ApplicationController
  before_action :move_to_root, except: [:index, :show]

  def index
    @items = Item.includes(:images)
  end
  
  def new
  end
    
  def create
    @item = Item.create(item_params)
    if  @item.save
      redirect_to items_path, notice: "出品しました"
    else
      redirect_to  new_item_path, notice: "出品できません。入力必須項目を確認してください"
    end
  end

  def edit
  end
   
  def update
  end

  def destroy
  end
  
  def show
  end

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

  private
  def item_params
    params.require(:item).permit(:name, :descripton, :condition,:prefecture,:size,:price,:shipping_days,:postage,:user_id,:category_id,:brand_id,images_attributes: [:url, :item_id]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end 

end
