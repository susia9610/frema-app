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
    binding.pry
    @item = Item.new(set_params)
      @item.save
      redirect_to new_item_path
  end
    
  # def create
  #   @item = Item.new(item_params)
  #   if  @item.save
  #     redirect_to roots_path, notice: "出品しました"
  #   else
  #     redirect_to  new_item_path, notice: "出品できません。入力必須項目を確認してください"

  #   end
  # end

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
    params.require(:item).permit(:name, :description, :category_id, :brand, :condition_id, :prefecture_id, :size, :price, :shipping_days, :postage_id, images_attributes: [:image, :_destroy, :id])
    # .merge(user_id: current_user.id)
  end

  # def purchase
  # end

  # def move_to_root
  #   redirect_to root_path unless user_signed_in?
  #   flash[:alert] = 'ログインしてください'
  # end

  # private
  # def item_params
  #   params.require(:item).permit(:name, :descripton, :condition,:prefecture,:size,:price,:shipping_days,:postage,:user_id,:category_id,:brand_id,images_attributes: [:url, :item_id]).merge(user_id: current_user.id)
  # end
  
  # def set_item
  #   @item = Item.find(params[:id])
  # end 

end
