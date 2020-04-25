class User < ApplicationRecord
  has_secure_password
  has_many :chores
  has_many :categories, through: :chores
  has_many :comments, through: :chores
  validates :email, presence: {:message => "You need an email to register"}
  validates :email, uniqueness: {:message => "This email is already in use"}

  def self.find_or_create_by_omniauth(auth_hash)

    oauth_email = auth_hash["info"]["email"]
    self.where(:email => oauth_email).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def top_categories
    #binding.pry
   Category.most_popular(self)
  end


end
