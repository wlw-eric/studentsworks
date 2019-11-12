class Work < ApplicationRecord
  has_one :creator, class_name: :User, through: :project
  belongs_to :speaker, class_name: :User
  belongs_to :project
end
