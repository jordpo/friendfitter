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
    workout = FactoryGirl.create(:workout)
    expect(workout).to be_valid
  end
  it 'is invalid without a name'
  it 'is invalid without a difficulty'
  it 'is invalid without a user_id'
  it 'is invalid without a community_id'
end
