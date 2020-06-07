class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: "creator_id"
  has_many :invitations, foreign_key: 'attendee_id'
  has_many :attended_events, through: :invitations

  def future_events
    self.attended_events.where("DATE(date) >= DATE(?)", Time.now).order("date DESC")
  end

  def past_events
    self.attended_events.where("DATE(date) < DATE(?)", Time.now).order("date DESC")
  end
end
