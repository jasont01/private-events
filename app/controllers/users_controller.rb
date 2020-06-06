class UsersController < ApplicationController
  #before_action :authenticate_user!

  def index
    @users = User.all
    @future_events = Event.all.where("DATE(date) >= DATE(?)", Time.now).order("date ASC")
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @future_events = @user.events.where("DATE(date) >= DATE(?)", Time.now).order("date DESC")
    @past_events = @user.events.where("DATE(date) < DATE(?)", Time.now).order("date DESC")
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
