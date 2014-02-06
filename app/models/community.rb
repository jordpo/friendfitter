class Community < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :workouts
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 160 }
end
