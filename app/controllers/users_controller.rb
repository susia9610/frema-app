class UsersController < ApplicationController
before_action :set_user_params, only: [:show, :edit_detail, :update_detail]

  def index
    @items = @user.items 
  end

  def show
    @items = @user.items
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end




  def edit_detail
  end

  def update_detail
    @user.update(update_detail_params)
    unless @user.update(update_detail_params)
      redirect_to user_edit_detail_path(@user.id), notice: "変更できません。メールアドレスとパスワードは必須項目です"
    end
    sign_in(:user, @user)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  private
  def set_user_params
    @user = User.find(params[:user_id])
  end
  
  def update_detail_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  

  
end
