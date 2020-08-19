class User < ApplicationRecord
  has_secure_password
  mount_uploader :avatar, AvatarUploader
end
