class RidesController < ApplicationController

    def create  
      #after testing try switching the current user method in application helper
      #user = User.find_by_id(session[:user_id])
      user = current_user
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