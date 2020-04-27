class Task < ApplicationRecord
  belongs_to :chore
  has_many :lists, dependent: :destroy
  accepts_nested_attributes_for :lists

  def completed?
    !completed_at.blank?
  end

end
