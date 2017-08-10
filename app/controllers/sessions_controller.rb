class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    render :new
  end

  def create
    user = User.where("email = ? or username = ?", params[:identifier], params[:identifier]).take
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_or_to root_path
    else
      status 422
      erb :"/sessions/new", locals: {errors: ["Invalid username/email or password"], login: false}
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
