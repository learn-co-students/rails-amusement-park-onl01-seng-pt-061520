class UsersController < ApplicationController
  before_action :find_user, only: [:show]
  before_action :redirect_to_signup_if_not_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
