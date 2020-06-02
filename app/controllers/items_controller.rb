class ItemsController < ApplicationController
  before_action :set_params, only: :create

  def index
    
  end
  
  def new
    @item = Item.new
    @item.images.new
  end
    
  def create
    @item = Item.new(set_params)
    if @item.valid?
      @item.save
    # else
    #   redirect_to new_item_path
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
  def set_params
    params.require(:item).permit(:name, :description, :category_id, :brand, :condition_id, :prefecture_id, :size, :price, :shipping_days_id, :postage_id, images_attributes: [:src])
  end

end