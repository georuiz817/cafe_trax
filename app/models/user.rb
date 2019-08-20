class User < ActiveRecord::Base
  has_many :restuarants
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
