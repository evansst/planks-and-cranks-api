class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :update, :destroy]

  # GET /listings
  def index
    @listings = []
    listings = Listing.all

    listings.each do |listing|
      image_urls = set_image_urls(listing)
      @listings << { listing: listing, image_urls: image_urls}
    end

    render json: { listings: @listings }
  end

  # GET /listings/1
  def show
    image_urls = set_image_urls(@listing)

    render json: { listing: @listing, image_urls: image_urls }
  end

  # POST /listings
  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      render json: @listing, status: :created, location: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /listings/1
  def update
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_image_urls listing
      listing.images.map { |image| 'http://localhost:3000' + rails_blob_path(image, only_path: true) }
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.require(:listing).permit(:type, :specs, :size, :condition, :price, :msrp, :description, :user_id)
    end
end
