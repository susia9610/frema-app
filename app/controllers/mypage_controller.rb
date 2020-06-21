class MypageController < ApplicationController
  before_action :authenticate_user! , only: [:index, :logout, :new]
  
  def index
    @nickname = current_user.nickname
    @favorites = Favorite.where(user_id: current_user.id)
    @items = Item.all.includes(:images).where(status_id: "1").order(created_at: :desc)
    #@items = @user.items 
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
end

private