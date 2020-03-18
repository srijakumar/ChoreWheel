class Chore < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :category
    accepts_nested_attributes_for :category

    validates :title, presence: true

end
