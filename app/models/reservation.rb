class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: 'User'
  enum status: { pending: 0, booked: 1, cancelled: 2, canceling: 3, expired: 4 }
  has_one :calendar_event, dependent: :destroy, required: true
  has_one :host, through: :listing

  delegate :start_date, to: :calendar_event
  delegate :end_date, to: :calendar_event
  delegate :nights, to: :calendar_event
end
