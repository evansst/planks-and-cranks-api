class AddImagesToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :images, :string, array: true, default: []
  end
end
