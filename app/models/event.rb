class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations, foreign_key: "attended_event_id"
  has_many :attendees, through: :invitations, source: :attendee

  def self.future
    Event.all.where("DATE(date) >= DATE(?)", Time.now).order("date ASC")
  end

  def self.past
    Event.all.where("DATE(date) < DATE(?)", Time.now).order("date DESC")
  end
end
