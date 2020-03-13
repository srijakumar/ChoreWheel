class Task < ApplicationRecord
  belongs_to :chore
  has_many :lists, dependent: :destroy

  def completed?
    !completed_at.blank? #if time is not present, then task not completed. re method complete in task controller
  end
end
