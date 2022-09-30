class Listing < ApplicationRecord
  has_many :rooms
  has_many :photos
  validates :title, presence: true
  validates :max_guests, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  belongs_to :host, class_name: 'User'
  enum status: { draft: 0, published: 1, archived: 2 }
  scope :published, -> { where(status: :published) }

  def address
    "#{address_line1} #{address_line2} #{city} #{state}"
  end
end
