class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:images)
  end
  
  def new

  end
    
  def create
    
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
  def set_item
    @item = Item.find(params[:id])
  end 

end
