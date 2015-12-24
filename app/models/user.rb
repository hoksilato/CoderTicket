class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 3 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, email: true
end
