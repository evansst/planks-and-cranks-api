require 'carrierwave/processing/mini_magick'

class Listing < ApplicationRecord
  include CarrierWave::MiniMagick

  belongs_to :user
  has_many_attached :images

  def add_image(image)
    new_image = MiniMagick::Image.open(image[:io])
    new_image.format("png")
    new_image.resize("600x600")
    # new_image.resize_to_fill(600, 600)
  
    images.attach(io: File.open(new_image.path), filename: new_image.path.split('/').last)

  end
end
