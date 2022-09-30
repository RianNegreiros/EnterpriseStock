class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def cancel
    @reservation = current_user.reservations.find(params[:id])
    refund = Stripe::Refund.create({
      payment_intent: @reservation.stripe_payment_intent_id,
    })
    @reservation.update(status: :canceling, stripe_refund_id: refund.id)
    redirect_to reservation_path(@reservation)
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      listing = @reservation.listing
      checkout_session = Stripe::Checkout::Session.create(
        success_url: reservation_url(@reservation),
        cancel_url: listing_url(listing),
        customer: current_user.stripe_customer_id,
        mode: 'payment',
        line_items: [{
          price_data: {
            unit_amount: listing.nightly_price,
            currency: 'usd',
            product: listing.stripe_product_id,
          },
          quantity: 1
        }, {
          price_data: {
            unit_amount: listing.cleaning_fee,
            currency: 'usd',
            product: 'prod_MWnJL6raBRxnNp'
          },
          quantity: 1
        }],
        metadata: {
          reservation_id: @reservation.id
        },
        payment_intent_data: {
          application_fee_amount: ((listing.cleaning_fee + listing.nightly_price) * 0.10).to_i,
          transfer_data: {
            destination: listing.host.stripe_account_id
          },
          metadata: {
            reservation_id: @reservation.id
          }
        }
      )
      @reservation.update(session_id: checkout_session.id)
      redirect_to checkout_session.url, allow_other_host: true
    else
      flash[:errors] = @reservation.errors.full_messages
      redirect_to listing_path(params[:reservations][:listing_id])
    end
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:listing_id)
  end
end
