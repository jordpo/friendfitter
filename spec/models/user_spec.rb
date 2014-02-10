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
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  describe 'validations' do
    before :each do
      @jord = User.create(username: 'jord', email: 'jord@mail.com', password: 'abc123abc')
    end
    it 'is invalid without a username' do
      user = FactoryGirl.build(:user, username: nil)
      expect(user).to_not be_valid
    end
    it 'is invalid with a non unique username' do
      @jord2 = User.create(username: 'jord', email: 'jord@mail.com', password: 'abc123abc')
      expect(@jord2).to_not be_valid
    end
    it 'is invalid without an email' do
      user = FactoryGirl.build(:user, email: nil)
      expect(user).to_not be_valid
    end
  end

  describe "associations" do
    it { should have_many :workout_sessions }
    it { should have_many :exercise_sessions }
    it { should have_many :workouts }
    it { should have_and_belong_to_many :communities }
  end

  describe "#pr_count" do
    it 'returns the number of workout_sessions with pr = true for a user' do
    end
  end
end
