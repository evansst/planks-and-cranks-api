require 'carrierwave/orm/activerecord'

class ListingsController < ApplicationController
  before_action :authenticate, only: %i[create update destroy]
  before_action :set_listing, only: %i[show update destroy]

  # GET /listings
  def index
    @listings = Listing.all

    render json: @listings
  end

  # GET /listings/1
  def show
    render json: @listing
  end

  # POST /listings
  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      if params[:images]
        @listing.update(images: [File.open(params[:images])])
      end
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

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.permit(:listing, :id, :gear_type, :size, :condition, :price, :msrp, :description, :user_id, :brand, :model, :year, { images: [] })
    end
end
