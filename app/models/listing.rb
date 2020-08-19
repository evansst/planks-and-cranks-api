class Listing < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, ImageUploader

  def add_image(image)
    images = self.images
    images << image[:io]
    self.update(images: images);

    self.save!
  end
end
