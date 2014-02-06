# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  name       :text
#  detail     :text
#  duration   :text
#  workout_id :integer
#  created_at :datetime
#  updated_at :datetime
#  video_id   :text
#

FactoryGirl.define do
  factory :exercise do |f|
    f.name 'Thruster'
    f.detail 'Lipsum Upsum Yadda Yadda'
    f.duration 'Yadda Yadda'
    f.video_id 'askjdfakdjn'
  end
end
