class UsersController < ApplicationController
  #before_action :set_category
  before_action :set_user_params, only: [:show, :edit, :update]
  before_action :set_user_current, only: [:index, :edit_detail, :update_detail]

  def index
    #@items = @user.items
  end

  def show
    #@items = @user.items
  end

  def edit
  end

  def update
    @user.update(update_params)
    unless @user.update(update_params)
      redirect_to edit_user_path(@user.id), notice: "変更できません。ニックネームとパスワードは必須項目です"
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
  
  def set_user_params
    @user = User.find(params[:id])
  end

  def set_user_current
    @user = User.find(current_user.id)
  end

  def update_params
    params.require(:user).permit(:nickname, :password, :encrypted_password)
  end

  def update_detail_params
    params.require(:user).permit(:email, :password, :encrypted_password)
  end

  # def set_category
    # @category_parent_array = []
     # Category.where(ancestry: nil).each do |parent|
      #  @category_parent_array << parent
      #end
  end


end
