class FavoritesController < ApplicationController
before_action :set_item, only: [:create, :destroy]
before_action :set_parents, only: [:index]

  def index
    @nickname = current_user.nickname
    @favorites = Favorite.order(created_at: "DESC").page(params[:page]).per(3).where(user_id: current_user.id)
    @items = Item.all.includes(:images).where(status_id: "1").order(created_at: :desc)
  end
  
  def create
    @favorite = Favorite.new(
      user_id: current_user.id, 
      item_id: @item.id
    )
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(
      user_id: current_user.id, 
      item_id: @item.id
    )
    @favorite.destroy
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end


