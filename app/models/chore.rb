class Chore < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :lists, through: :tasks
  has_many :comments, dependent: :destroy
  #has_many :categories, dependent: :destroy
  belongs_to :category
  belongs_to :user
  validates :title, presence: true
  scope :recent, -> {order(created_at: :desc)}
end
