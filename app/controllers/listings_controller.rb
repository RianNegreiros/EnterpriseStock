class ListingsController < ApplicationController
  def index
    @listings = Listing.where(status: :published)
  end

  def show
    @listing = Listing.where(status: :published).find(params[:id])
  end
end
