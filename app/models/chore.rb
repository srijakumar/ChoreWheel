class Chore < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
