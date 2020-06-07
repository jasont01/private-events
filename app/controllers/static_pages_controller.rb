class StaticPagesController < ApplicationController
  def home
    @home = true
    @future_events = Event.all.where("DATE(date) >= DATE(?)", Time.now).order("date ASC")
  end
end
