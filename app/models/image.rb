class Image < ActiveRecord::Base

  belongs_to :prototype
  enum status: %i(main, sub)
  mount_uploader :image, ImageUploader
end
