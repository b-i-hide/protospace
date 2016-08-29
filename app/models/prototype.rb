class Prototype < ActiveRecord::Base

  #association
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :main_image, class_name: "Image"

  #set tag
  acts_as_ordered_taggable_on :tags
  acts_as_taggable_on :prototypes

  # validation
  validates :title, presence: true

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }, limit: 4

  paginates_per 8

  def posted_date
    created_at.strftime("%b %d")
  end

  MAX_OF_SUB_IMAGES = 3
  def sub_image_fields
    sub_images = images.sub
    MAX_OF_SUB_IMAGES.times{ |i|  sub_images[i] ||= images.build(status: 'sub')}
    sub_images
  end

  def like_user(user)
    likes.find_by(user_id: user)
  end

end
