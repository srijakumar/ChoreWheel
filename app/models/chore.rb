class Chore < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :lists, through: :tasks
  has_many :comments, dependent: :destroy
  belongs_to :category
    accepts_nested_attributes_for :category

    validates :title, presence: true


    scope :recent, -> {order(created_at: :desc)}
    #scope :ordered_by_title, -> { order(title: :asc) }
end
