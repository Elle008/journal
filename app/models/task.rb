class Task < ApplicationRecord

  validates :task, presence: true

  belongs_to :category
  belongs_to :user

end
