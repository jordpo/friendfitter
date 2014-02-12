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

require 'spec_helper'

describe Workout do
  it 'has a valid factory' do
    workout = create(:workout)
    expect(workout).to be_valid
  end
  it 'is invalid without a name' do
    workout = build(:workout, name: nil)
    expect(workout).to_not be_valid
  end
  it 'is invalid without a difficulty' do
    workout = build(:workout, difficulty: nil)
    expect(workout).to_not be_valid
  end
  it 'is invalid without a user_id' do
    workout = build(:workout, user_id: nil)
    expect(workout).to_not be_valid
  end
  it 'is invalid without a community_id' do
    workout = build(:workout, community_id: nil)
    expect(workout).to_not be_valid
  end
end
