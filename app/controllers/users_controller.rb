class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit]

  def index
    @users = User.all
    @future_events = Event.future
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
    @future_events = @user.future_events
    @past_events = @user.past_events
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
