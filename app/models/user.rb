class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true
  #, :message => "You need an email to register"
  validates :email, :uniqueness => true
  #, :message => "This email is already in use"

end
