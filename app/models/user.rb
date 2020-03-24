class User < ApplicationRecord
  has_secure_password
  has_many :comments, through: :chores
  validates :email, presence: {:message => "You need an email to register"}
  validates :email, uniqueness: {:message => "This email is already in use"}

  def self.find_or_create_by_omniauth(auth_hash)

    oauth_email = auth_hash["info"]["email"]
    self.where(:email => oauth_email).first_or_create do |user|
      user.password = SecureRandom.hex
    end
    # refactored above
    # if user = User.find_by(:email => oauth_email)
    #   return user
    # else
    #   user = User.create(:email => oauth_email, :password => SecureRandom.hex)
    # end


  end


end
