class MypageController < ApplicationController
  before_action :authenticate_user! , only: [:index, :logout, :new]##:cardは実装前のため、未だ反映していない
  
  def index
  end

  def card
  end

  def logout
  end

  def new
  end
  
  def edit
  end

  def create
  end

  def show
  end
end

