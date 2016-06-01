class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
