class User < ApplicationRecord
  has_secure_password
  mount_uploader :avatar, AvatarUploader

  validates :username, presence: true, uniqueness: true
  validates :email_address, uniqueness: true
end
