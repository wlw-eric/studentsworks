class Work < ApplicationRecord
  belongs_to :creator, class_name: :User, through: :project
  belongs_to :speaker, class_name: :User
  belongs_to :project
end
