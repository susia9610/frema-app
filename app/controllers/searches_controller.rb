class SearchesController < ApplicationController
  before_action :set_parents, only: [:index]

  def index
    @items = Item.search(params[:search]).limit(132)
    @search = params[:search]
  end


  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
