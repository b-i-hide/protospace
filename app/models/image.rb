class Image < ActiveRecord::Base

  belongs_to :prototype
  enum status: { main: 'main', sub: 'sub'}
  mount_uploader :image, ImageUploader
end
