require 'spec_helper'

describe User do
  it 'has a valid factory' do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end
  it 'is invalid without a username' do
    user = FactoryGirl.build(:user, username: nil)
    expect(user).to_not be_valid
  end
  it 'is invalid without an email' do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to_not be_valid
  end
end
