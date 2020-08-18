class Listing < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  def add_image(image)
    new_image = MiniMagick::Image.open(image[:io])
    new_image.resize("600x600")
    new_image.format("jpg")
  
    images.attach(io: File.open(new_image.path), filename: new_image.path.split('/').last)

  end
end
