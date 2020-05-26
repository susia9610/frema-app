class ItemsController < ApplicationController
  
  def index
    
  end
  
  def new
  end
    
  def create
    @item = Item.create(item_params)
      @item.save
      redirect_to items_path, notice: "出品しました"
    else
      redirect_to new_item_path, notice: "出品できません。入力必須項目を確認してください"
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

  private
  def item_params
    params.require(:item).permit(:name, :descripton, :condition,:prefecture,:size,:price,:shipping_days,:postage,:user_id,:category_id,:brand_id,images_attributes: [:url, :item_id]).merge(user_id: current_user.id)
  end
end
