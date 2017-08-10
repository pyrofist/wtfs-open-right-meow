class LocationsController < ApplicationController
  skip_before_action :require_login

  def index
    @locations = Location.all.order("created_at desc").limit(5)
    if session[:user_id]
      user = User.find(session[:user_id])
      @user_locations = user.locations
    end
    render :index
  end

  def new
    render :new
  end

  def create
    location = Location.new(address: params[:address])
    if location.valid?
      location.save
      redirect_to location
    else
      render :new, locals: {errors: location.errors.full_messages}
    end
  end

  def show
    @location = Location.find(params[:id])
    favorited = false
    if session[:user_id]
      user = User.find(session[:user_id])
      favorited = user.favorited(@location)
    end
    render :show, locals: {favorited: favorited}
  end

end
