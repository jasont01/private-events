class InvitationsController < ApplicationController
  
  def create
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])

    if already_signed_up
      flash[:alert] = "You are already signed up to attend #{@event.event_name}!"
    else
      @event.attendees << current_user
      flash[:notice] = "You are now signed up to attend #{@event.event_name}"
    end
    redirect_to @event
  end

  private

  def already_signed_up
    Invitation.exists?(attendee_id: @user, attended_event_id: @event)
  end

end
