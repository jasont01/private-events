class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]

  def index
    @events = Event.future
  end

  def past
    @events = Event.past
  end
  
  def show
    @event = Event.find(params[:id])
    @user = current_user
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = "Event successfully created"
      redirect_to @event
    else
      flash[:alert] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = 'Event was successfully deleted.'
      redirect_to events_url
    else
      flash[:alert] = 'Something went wrong'
      redirect_to events_url
    end
  end
  
  private

  def event_params

    params.require(:event).permit(:event_name, :description, :location, :date)

  end

end
