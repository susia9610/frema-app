class CardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card

  require "payjp"

  def index
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(customer.default_card)
      @card_brand = @card_info.brand
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      case @card_brand
      when "Visa"
        @card_image = "visa.svg"
      when "JCB"
        @card_image = "jcb.svg"
      when "MasterCard"
        @card_image = "master-card.svg"
      when "American Express"
        @card_image = "american_express.svg"
      when "Diners Club"
        @card_image = "dinersclub.svg"
      when "Discover"
        @card_image = "discover.svg"
      end
    end
  end

  # def new
  #   card = Card.where(user_id: current_user.id)
  #   redirect_to action: "show" if card.exists?
  # end

  def new
    @card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if @card.present?
  end

  # def pay #payjpとCardのデータベース作成を実施します。
  #   Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #   if params['payjp-token'].blank?
  #     redirect_to action: "new"
  #   else
  #     customer = Payjp::Customer.create(
  #     description: '登録テスト', 
  #     email: current_user.email, 
  #     card: params['payjp-token'],
  #     metadata: {user_id: current_user.id}
  #     ) 
  #     @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
  #     if @card.save
  #       redirect_to action: "show"
  #     else
  #       redirect_to action: "pay"
  #     end
  #   end
  # end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjpToken'].blank?
      render "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        if request.referer&.include?("/registrations/step5")
          redirect_to controller: 'registrations', action: "step6"
        else
          redirect_to action: "index", notice:"支払い情報の登録が完了しました"
        end
      else
        render 'new'
      end
    end
  end

  # def delete #PayjpとCardデータベースを削除します
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #   else
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #     redirect_to action: "new"
  # end

  # def show #Cardのデータpayjpに送り情報を取り出します
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #     redirect_to action: "new" 
  #   else
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     @default_card_information = customer.cards.retrieve(card.card_id)
  #   end
  # end

  def destroy
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      redirect_to action: "index", notice: "削除しました"
    else
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end