class Project < ApplicationRecord
  # belongs_to :creator_id
  belongs_to :creator, class_name: :User
  has_one :work
end
