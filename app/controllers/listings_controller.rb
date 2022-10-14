class ListingsController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @listings = pagy(Listing.published, items: 10)
  end

  def show
    @listing = Listing.published.find(params[:id])
  end
end
