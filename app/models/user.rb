class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  
  has_many :listings, foreign_key: :host_id
  has_many :reservations, foreign_key: :guest_id
  has_many :host_reservations, class_name: 'Reservation', through: :listings, source: :reservations
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :sent_messages, class_name: 'Message', foreign_key: 'from_user_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'to_user_id'

  after_commit :maybe_create_stripe_customer, on: [:create, :update]

  def all_reservations
    Reservation.where(guest: self).or(Reservation.where(listing: listings))
  end

  def maybe_create_stripe_customer
    return if !stripe_customer_id.blank?

    customer = Stripe::Customer.create(
      email: email,
      name: name,
      metadata: {
        lodging_id: id
      }
    )
    update(stripe_customer_id: customer.id)
  end
  
        def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            user.name = auth.info.name   # assuming the user model has a name
            user.image = auth.info.image # assuming the user model has an image
            # If you are using confirmable and the provider(s) you use validate emails, 
            # uncomment the line below to skip the confirmation emails.
            user.skip_confirmation!
          end
        end
end
