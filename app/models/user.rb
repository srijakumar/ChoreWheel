class User < ApplicationRecord
  has_secure_password
  validates :email, presence: {:message => "You need an email to register"}
  validates :email, uniqueness: {:message => "This email is already in use"}

end
