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
    
  def edit_detail
  end

  def update_detail
    @user.update(update_detail_params)
    unless @user.update(update_detail_params)
      redirect_to user_edit_detail_path(@user.id), notice: "変更できません。メールアドレスとパスワードは必須項目です"
    end
    sign_in(:user, @user)
  end

  private
  def set_user_params
    @user = User.find(params[:user_id])
  end
  
  def update_detail_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
