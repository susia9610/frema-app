class UsersController < ApplicationController
  
  before_action :set_user_params, only: [:show, :edit, :update]
  before_action :set_user_current, only: [:index, :edit_detail, :update_detail]

  def index
    
  end

  def show
    
  end

  def edit
  end

  def update
    
    unless @user.update(update_params)
      redirect_to edit_user_path(@user.id), notice: "変更できません。ニックネームとパスワードは必須項目です"
    end
    sign_in(:user, @user)
  end

  def edit_detail
  end

  def update_detail
    
    unless @user.update(update_detail_params)
      redirect_to user_edit_detail_path(@user.id), notice: "変更できません。メールアドレスとパスワードは必須項目です"
    end
    sign_in(:user, @user)
  end


  private
  
  def set_user_params
    @user = User.find(params[:id])
  end

  

  def update_params
    params.require(:user).permit(:nickname, :password, :encrypted_password)
  end

  def update_detail_params
    params.require(:user).permit(:email, :password, :encrypted_password)
  end

  
  


end
