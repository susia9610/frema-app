class ItemsController < ApplicationController
before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:images)
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  

end
