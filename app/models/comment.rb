class Comment < ApplicationRecord
  belongs_to :chore
  belongs_to :user, optional: true

end
