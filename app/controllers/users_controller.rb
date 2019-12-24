class UsersController < ApplicationController
  def  new
    user= User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:success]="Welcome #{params[:user][:name]}"
      cookies.permanent[:user_id]=@user.id
      cookies.permanent[:remember_token]= user.remember_token
      redirect_to users_path
    else
      render 'new'

    end
  end

  def show
    @user=User.find{params[:id]}
  end

  def index
    @users=User.all
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :user_id)
    end
end