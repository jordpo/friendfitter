# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  username               :text             default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  mantra                 :text
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#

require 'spec_helper'

describe User do
  it 'has a valid factory' do
    user = create(:user)
    expect(user).to be_valid
  end

  describe 'validations' do
    before :each do
      @jord = User.create(username: 'jord', email: 'jord@mail.com', password: 'abc123abc')
    end
    it 'is invalid without a username' do
      user = build(:user, username: nil)
      expect(user).to_not be_valid
    end
    it 'is invalid with a non unique username' do
      @jord2 = User.create(username: 'jord', email: 'jord@mail.com', password: 'abc123abc')
      expect(@jord2).to_not be_valid
    end
    it 'is invalid without an email' do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end
  end

  describe "associations" do
    it { should have_many :workout_sessions }
    it { should have_many :exercise_sessions }
    it { should have_many :workouts }
    it { should have_and_belong_to_many :communities }
  end

  describe 'instance_methods' do
    before :each do
      @jord = User.create(username: 'jord', email: 'jord@mail.com', password: 'abc123abc')
      @dess = User.create(username: 'dess', email: 'dess@mail.com', password: 'abc123abc')
      @rvc = Community.create(name: 'RVC', description: 'Upper Valley Locals')
      @jord.communities << @rvc
      @workout = Workout.create(name: 'new_space', difficulty: 'easy', community: @rvc, user: @jord)
      @workout2 = Workout.create(name: 'new_space_redux', difficulty: 'medium', community: @rvc, user: @jord)
      @jord.workout_sessions << WorkoutSession.create(workout: @workout, pr: true, comment: 'yeah', accomplished: true)
      @jord.workout_sessions << WorkoutSession.create(workout: @workout2, pr: false, comment: 'blah', accomplished: true)
    end
    describe "#pr_count" do
      it 'returns 1 for the user @jord since he has one pr across workout sessions' do
        expect(@jord.pr_count).to eq 1
      end
    end

    describe '#finished_count' do
      it 'returns number of workout_sessions where accomplished = true' do
        expect(@jord.finished_count).to eq 2
      end
    end

    describe '#community_member?' do
      it 'returns true or false depending on whether user is connected to community' do
        expect(@jord.community_member?(@rvc)).to eq true
        expect(@dess.community_member?(@rvc)).to eq false
      end
    end

    describe '#participating?' do
      it 'returns true if user is currently doing the workout passed in as a parameter' do
        expect(@jord.participating?(@workout)).to eq true
        expect(@dess.participating?(@workout)).to eq false
      end
    end
  end

end
