class UsersController < ApplicationController
  before_action :set_user_params, only: [:edit, :update]
  

  def index
    
  end

  def show
   
  end

  def new
    @user = User.new
  end
  
  def edit
    
  end

  def update
    @user = User.user
   
    unless @user.update(update_params)
      redirect_to edit_user_path(@user.id), notice: "変更できません。必須項目が入力されていません"
    end
    sign_in(:user, @user)
  end

  private
  def update_params
    params.require(:user).permit(:familyname, :firstname, :familyname_kana, :firstname_kana, :email, :password, :birth_year, :birth_month, :birth_day)
  end

  def set_user_params
    @user = User.find(params[:id])
  end




end
