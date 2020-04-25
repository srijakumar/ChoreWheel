class Category < ApplicationRecord
  has_many :chores
  has_many :users, through: :chores
  # gets top 3 most popular categories for a specific user

    scope :most_popular, -> (user) {
      joins(chores: :user)
      .where(chores: {user_id: user.id})
      .group("name")
      .order("count(name) desc")
      .limit(3)
    }

    # gets the number of users who use this category
    # this is an instance method, so scoped to a single category
    def number_of_users
      users.uniq.count
    end
end
