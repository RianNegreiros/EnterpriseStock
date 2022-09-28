class Listing < ApplicationRecord
  validates :title, presence: true
  validates :max_guests, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  belongs_to :host, class_name: 'User'
  enum status: { draft: 0, published: 1, archived: 2 }
end
