class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }, limit: 4
end
