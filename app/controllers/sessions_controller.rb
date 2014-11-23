class SessionsController < ApplicationController
def new
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect_to admin_url
  else
    session[:user_id] = nil
    @error = "El email o contrasenia son incorrectos"
    render :action => "create"
  end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def create
  end
end
