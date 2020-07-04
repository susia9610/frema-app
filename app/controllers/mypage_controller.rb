class MypageController < ApplicationController
  before_action :authenticate_user! , only: [:index, :logout, :new]
  before_action :set_parents, only: [:index,:logout]
  
  def index
    @nickname = current_user.nickname
    @favorites = Favorite.order(created_at: "DESC").page(params[:page]).per(3).where(user_id: current_user.id)
    @items = Item.all.includes(:images).where(status_id: "1").order(created_at: :desc)
  end

  def show
  end

  def new
  end
  
  def edit
  end

  def update
  end
  
  def create
  end

  def logout
  end

  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end
