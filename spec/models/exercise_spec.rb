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

require 'spec_helper'

describe Exercise do
  it 'has a valid factory' do
    exercise = FactoryGirl.create(:exercise)
    expect(exercise).to be_valid
  end
  it 'is invalid without a name' do
    exercise = FactoryGirl.build(:exercise, name: nil)
    expect(exercise).to_not be_valid
  end
  it 'is invalid without a video_id' do
    exercise = FactoryGirl.build(:exercise, video_id: nil)
    expect(exercise).to_not be_valid
  end
end
