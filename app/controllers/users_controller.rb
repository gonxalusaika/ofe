class UsersController < ApplicationController
	include ApplicationHelper
  before_filter :authenticate
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
  	@users = User.all
  end

 	def new
  	@user = User.new
  end

  def create
	  @user = User.new(user_params)
	  if @user.save
      # UserMailer.confirmacion_registro(@user).deliver
  		session[:user_id]=@user.id
  		redirect_to root_url
	  else
		  render :action => "new"
	  end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuario se actualizó con exito.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def user_params
  	  params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :es_admin)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
