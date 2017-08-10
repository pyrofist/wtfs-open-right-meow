class UsersController < ApplicationController
  skip_before_action :require_login
  
  def new
    @user = User.new
    render :new
  end

  def create
    password = params[:user][:password]
    @user = User.new(user_params)
    if @user.save
      login(@user.email, password)
      redirect_back_or_to root_path
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
