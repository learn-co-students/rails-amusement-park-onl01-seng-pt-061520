class RidesController < ApplicationController
    def new
        current_user
        user = @current_user
        attraction = Attraction.find_by(id: params[:format])
        ride = Ride.create(attraction: attraction, user: user)
        flash[:message] = ride.take_ride

        redirect_to user_path(user)

    end

private

  #  def ride_params
   #     params.require(:attraction_id)
   #   end
end