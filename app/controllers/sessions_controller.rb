class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.where("email = ? or username = ?", params[:identifier], params[:identifier]).take
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:referer]
        target = "#{session[:referer]}"
        session.delete(:referer)
        redirect target
      else
        redirect "/"
      end
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
