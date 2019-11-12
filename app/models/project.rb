class Project < ApplicationRecord
  # belongs_to :creator_id
  belongs_to :creator, class_name: :User
  has_one :work

  validates :name, presence: true
  validates :description, presence: true
  validates :objective, presence: true
  validates :progress, presence: true, default: 1
  validates :category, presence: true, inclusion: { in: ["Digital", "Marketing", "Design"] }
end
