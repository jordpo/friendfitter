# spec/models/community.rb

require 'spec_helper'

describe Community do
  it 'has a valid factory' do
    FactoryGirl.create(:community).should be_valid
  end
  it 'is invalid without a name'
  it 'is invalid without description'
end
