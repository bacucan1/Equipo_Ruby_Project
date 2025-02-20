class UserController < ApplicationController
  before_action :active_account
  def index
    @user_list = User.all 
  end

  def profile
    
  end

  def pass
    dar_contraseña
    redirect_to profile_path
  end

  def signing_form
    if verificacion
      @profile=params[:username]
      redirect_to user_path
    else
      redirect_to sign_path, alert: "El usuario o contraseña es incorrecto"
    end

  end

  def create
    existing_user = User.find_by(username: user_param[:username])
    if existing_user ||  params[:username]==nil || params[:username]==""
      redirect_to user_form_path, alert: "El nombre de usuario ya existe"
    else
      @user = User.new(user_param)
      if @user.save
         session[:pro]=params[:username]
         redirect_to user_path, notice: "Usuario guardado"
      else
        redirect_to user_form_path
      end
    end
  end

  def delete
    @user = identification
    if @user.destroy
      redirect_to user_path, notice: "usuario eliminado"
    else
      redirect_to user_path, notice: "Error usuario no eliminado"
    end
  end

  def logout
    session[:pro]=""
    redirect_to user_path
  end

private
  def user_param
    params.permit(:username, :password)
  end
  def verificacion
    if User.find_by(username: params[:username]) && User.find_by(password: params[:password])
      session[:pro]=params[:username]
    end
  end
  def identification
    @user=User.find_by(username: params[:usr])
  end
  def active_account
    @profile=session[:pro]
  end
  def dar_contraseña
    flash[:con] = User.find_by(username: active_account).password
  end

end
