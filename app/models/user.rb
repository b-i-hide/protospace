class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
