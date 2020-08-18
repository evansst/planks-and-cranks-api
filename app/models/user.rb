class User < ApplicationRecord
  has_one_attached :avatar

  attr_accessor :avatar_url
end
