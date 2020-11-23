class RidesController < ApplicationController

    def new
        @ride = Ride.new(ride_params)
      
        flash[:message] = @ride.take_ride

        redirect_to user_path(@ride.user_id)

    end


    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end

