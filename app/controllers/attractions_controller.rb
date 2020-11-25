class AttractionsController < ApplicationController
    before_action :find_attraction, only: [:show, :edit, :update, :create]

    def index
        @attractions = Attraction.all
        current_user
    end

    def show
        current_user
    end

    def new
        @attraction = Attraction.new
    end

    def edit
    end

    def create 
        current_user
        if current_user.admin
        @attraction = Attraction.create(attraction_params)
        return redirect_to new_attraction_path unless @attraction.save
        redirect_to attraction_path(@attraction)
        end
    end

    def update
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private
    def find_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
    end
end