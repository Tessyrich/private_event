# app/models/event.rb
class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    has_many :attendances, foreign_key: "attended_event_id", dependent: :destroy
    has_many :attendees, through: :attendances, source: :attendee
  
    scope :past, -> { where('date < ?', Time.now) }
    scope :upcoming, -> { where('date >= ?', Time.now) }
  end
