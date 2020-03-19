class Chore < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :lists, through: :tasks
  belongs_to :category
    accepts_nested_attributes_for :category

    validates :title, presence: true

end
