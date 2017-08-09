class FavoritesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    location = Location.find(params[:location_id])
    user.locations << location
    redirect "/locations/#{location.id}"
  end

  def destroy
    user = User.find(params[:user_id])
    location = Location.find(params[:location_id])
    user.locations.delete(location)
    redirect "/locations/#{location.id}"
  end
end
