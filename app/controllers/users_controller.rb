class UsersController < ApplicationController
  # before_action :set_user_params, only: [:show,:edit, :update]
  before_action :set_user_current, only: [:index, :edit_detail, :update_detail]

  def index
    @items = @user.items 
  end

  def show
    @items = @user.items
  end

  def new
    @user = User.new
  end
  
  def edit
    
  end

  def update
    @user.update(update_params)
   
    unless @user.update(update_params)
      redirect_to edit_user_path(@user.id), notice: "変更できません。必須項目が入力されていません"
    end
    sign_in(:user, @user)
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
  def update_params
    params.require(:user).permit(:nickname, :familyname, :firstname, :familyname_kana, :firstname_kana, :birth_year, :birth_month, :birth_day)
  end

  def set_user_params
    @user = User.find(params[:id])
  end

  def set_user_current
    @user = User.find(current_user.id)
  end

  def update_detail_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
