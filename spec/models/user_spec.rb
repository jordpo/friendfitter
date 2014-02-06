require 'spec_helper'

describe User do
  it 'has a valid factory' do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end
  it 'is invalid without a username'
  it 'is invalid without an email'
end
