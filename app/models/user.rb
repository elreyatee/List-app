class User < ActiveRecord::Base

  has_many :lists
  has_many :items
  has_many :marks

  has_secure_password validations: false #supresses default validations

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
end
