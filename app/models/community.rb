# == Schema Information
#
# Table name: communities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Community < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :workouts
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 160 }

end
