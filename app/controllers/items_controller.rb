class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :purchase, :done, :destroy, :pay]
  before_action :move_to_root, except: [:index, :show]
  before_action :authenticate_user!, only:[:purchase, :pay, :done]
  before_action :set_image, only:[:show, :purchase,:pay]
  before_action :set_card, only:[:purchase, :pay]
  before_action :set_parents, only:[:index,:new, :create,:show]
  
  require "payjp"

  def index
    @items = Item.all.includes(:images).where(status_id: "1").order(created_at: :desc)
  end
  
  def new
    @item = Item.new
    @item.images.new
  end

  def get_category_children
    @child = Category.find(params[:parent_id]).children
  end
  
  def get_category_grandchildren
    @grandchildren = Category.find(params[:child_id]).children
  end
    
  def create
    @item = Item.new(set_params)
    @item.status_id = EXHIBITING_STATUS
    if @item.save
      render :create, notice: '出品しました'
    else
      redirect_to new_item_path, alert: "出品できません。入力必須項目を確認してください"
    end
  end
 
  def edit
    if @item.seller_id == current_user.id
      @item.images.new
    else
      redirect_to root_path
    end
  end
   
  def update
    @item = Item.find(params[:id])
    @item.seller_id == current_user.id
    if @item.update(set_params)
      render :update, notice: '出品しました'
    else 
      redirect_to edit_item_path, alert: "編集できません。入力必須項目を確認してください"
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除に失敗しました"
    end
  end
  
  def show
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @child.parent 
  end

  def purchase
    if @item.seller_id == current_user.id
      redirect_to root_path
    else
      unless @item.status_id == "1"
        redirect_to root_path, notice: "購入済みです"
      end
      if @card.blank?
        flash[:alert] = '購入前にクレジットカードの登録をしてください'
        redirect_to creditcards_path
     else
        @address = Address.where(user_id: current_user.id).first
        Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
        customer = Payjp::Customer.retrieve(@card.customer_id) 
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
    @item.update(status_id: BUYING_STATUS, buyer_id: current_user.id)
    redirect_to done_item_path
  end
  
  def done
  end  

  def set_images
    @images = Image.where(item_id: params[:id])
  end
  
  def set_image
    @item_images = @item.images
    @image = @item_images.first
  end
  
  private
  def set_params
    params.require(:item).permit(:name, :description, :category_id, :brand, :condition_id, :prefecture_id, :size, :price, :shipping_days_id, :postage_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])

    begin
      @item = Item.find(params[:id])
    rescue
      redirect_to root_path
    end
  end

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

  def set_card
    @card = Creditcard.find_by(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end
