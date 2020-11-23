class AttractionsController < ApplicationController
    before_action :find_attraction
    
    def index
        @attractions = Attraction.all
        # @attraction = Attraction.new
    end
    
    def show
        # @attraction = Attraction.find_by(id: params[:id])
        @ride = Ride.new
    end

    def new
        # @attraction = Attraction.new
    end
    
    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction) 
    end
    
    def edit
        # @attraction = Attraction.find_by(id: params[:id])
    end
    
    def update
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def find_attraction
        if params[:id]
            @attraction = Attraction.find_by(id: params[:id])
        else
            @attraction = Attraction.new
        end
    end


    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    
    end
end
