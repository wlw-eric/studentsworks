class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects, foreign_key: :creator_id
  has_many :works, foreign_key: :speaker_id

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
