class InvitationsController < ApplicationController
  
  def create
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    flash.now[:notice] = "You are now signed up to attend #{@event.event_name}"
  end

end
