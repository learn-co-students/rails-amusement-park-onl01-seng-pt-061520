class RidesController < ApplicationController

  def create  
    
    # really should use a current user method
    user = User.find_by_id(session[:user_id])
    attraction = Attraction.find_by_id(ride_params)
    
    ride = Ride.create(attraction: attraction, user: user)
    message = ride.take_ride
    
    flash[:message] = message
    redirect_to user_path(user)
  end

  private 

  def ride_params
    params.require(:attraction_id)
  end
end
