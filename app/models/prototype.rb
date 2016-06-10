class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :images, dependent: :destroy
  has_one :main_image, class_name: "Image"

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }

  paginates_per 9

  def posted_date
    created_at.strftime("%b %d")
  end
end
