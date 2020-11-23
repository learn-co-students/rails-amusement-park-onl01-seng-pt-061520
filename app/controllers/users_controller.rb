class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        return redirect_to new_user_path unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)

    end
    
    def show
        if !session[:user_id]
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end

end
