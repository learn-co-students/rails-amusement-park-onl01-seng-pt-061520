class SessionsController < ApplicationController

    def new 
        
        @users = User.all
        @user = User.new
    end

    def create 

        @user = User.find_by(id: params[:user][:name])
        
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
        else
            flash[:alert] = "Invalid Password."
            redirect_to signin_path
        end
    end

    def destroy
    
        session.delete :user_id
        redirect_to root_path
    end
end
