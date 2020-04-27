class Chore < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :lists, through: :tasks
  has_many :comments, dependent: :destroy
  #has_many :categories, dependent: :destroy
  belongs_to :category
  belongs_to :user
  validates :title, presence: true
  scope :recent, -> {order(created_at: :desc)}


  scope :most_tasks, -> (chore) {
    joins(:tasks)
    .group("tasks.chore_id")
    .order("count(tasks.chore_id) desc").first
  }


  # SELECT COUNT(Tasks.id),Tasks.content, Chore.title
  # FROM Chore
  # JOIN Tasks
  # WHERE Chore.id = Tasks.chore_id
  # GROUp by Chore.title
  # ORDER BY COUNT(Tasks.content) DESC
  # LIMIT 1


  # scope :most_tasks, -> (chore) {
  #   joins(tasks: :chore)
  #   .where(tasks: {chore_id: chore.id})
  #   .group("title")
  #   .order("count(Task.content) desc")
  #   .limit(1)
  # }


end
