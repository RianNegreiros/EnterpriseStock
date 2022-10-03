class CalendarEvent < ApplicationRecord
  belongs_to :listing
  belongs_to :reservation, optional: true
  validates :status, presence: true
  enum status: { reserved: 0, blocked: 1 }

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_date, comparison: { less_than: :end_date }
  validates :start_date, inclusion: {
    in: (Date.today..Date.today + 365 + 365),
    message: "Must be in the future"
  }
  validates :start_date, :end_date, overlap: {
    exclude_edges: ['start_date', 'end_date'],
    scope: :listing_id,
    query_options: {
      joins: 'LEFT OUTER JOIN reservations r on r.id = calendar_events.reservation_id',
      where: 'r.status in (0, 1) or calendar_events.status = 1'
    },
    message_content: 'is already booked for this date range'
  }

  def nights
    (start_date...end_date).count
  end
end
