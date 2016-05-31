class Image < ActiveRecord::Base

  belongs_to :prototype

  enum image: { main: 0, sub: 1}
  validates :prototype_id
end
