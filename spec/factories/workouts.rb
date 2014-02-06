# == Schema Information
#
# Table name: workouts
#
#  id           :integer          not null, primary key
#  name         :text
#  difficulty   :text
#  posted       :boolean
#  started      :boolean
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  community_id :integer
#

require 'faker'

FactoryGirl.define do
  factory :workout do |f|
    f.name { Faker::Name.name }
    f.difficulty { Faker::Name.name }
    f.user FactoryGirl.create(:user)
    f.community FactoryGirl.create(:community)
  end
end
