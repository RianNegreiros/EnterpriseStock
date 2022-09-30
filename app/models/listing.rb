class Listing < ApplicationRecord
  has_many :rooms
  has_many :photos
  validates :title, presence: true
  validates :max_guests, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :nightly_price, numericality: { greater_than: 0 }
  validates :cleaning_fee, numericality: { greater_than: 0 }
  belongs_to :host, class_name: 'User'
  enum status: { draft: 0, published: 1, archived: 2 }
  scope :published, -> { where(status: :published) }

  after_commit :maybe_create_stripe_product, on: [:create, :update]

  def maybe_create_stripe_product
    return if !stripe_product_id.blank?

    product = Stripe::Product.create(
      name: title,
      url: Rails.application.routes.url_helpers.url_for(self),
      metadata: {
        lodging_id: self.id
      }
    )
    self.update(stripe_product_id: product.id)
  end

  def address
    "#{address_line1} #{address_line2} #{city} #{state}"
  end
end
