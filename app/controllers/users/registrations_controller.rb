class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  def new
    @user = User.new
  end


  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    session["devise.regist_data"][:user]["password_confirmation"]= params[:user][:password_confirmation]
    @address = @user.build_address
    render :new_address 
  
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    #super
  end

  
  
  
  def new_address
    @address = Address.new
  end


  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    unless @user.save
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  


  protected
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end
  

  def address_params
    params.require(:address).permit( :firstname, :lastname, :firstname_kana, :lastname_kana, :post_number, :prefecture_id, :local, :local_number, :building, :tel_number)
  end

  
end
  