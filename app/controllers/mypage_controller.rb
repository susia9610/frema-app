class MypageController < ApplicationController
  before_action :authenticate_user! , only: [:index, :logout, :new]##:cardは実装前のため、未だ反映していない
  
  def index
    @nickname = current_user.nickname
  end

  #def card
  #end

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