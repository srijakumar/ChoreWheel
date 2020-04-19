class Chore < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :lists, through: :tasks
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :destroy
  belongs_to :user

  #belongs_to :category
    #accepts_nested_attributes_for :category

  validates :title, presence: true


  scope :recent, -> {order(created_at: :desc)}
    #scope :ordered_by_title, -> { order(title: :asc) }
end



#many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user
#chore is a user submittable by app but not a foreign key!
