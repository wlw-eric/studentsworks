class Project < ApplicationRecord
  # belongs_to :creator_id
  belongs_to :creator, class_name: :User
  has_one :work

  validates :name, presence: true
  validates :description, presence: true
  validates :objective, presence: true
  validates :category, presence: true, inclusion: { in: ["Digital", "Marketing", "Design"] }

  mount_uploader :picture, PhotoUploader
end
