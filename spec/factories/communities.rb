# == Schema Information
#
# Table name: communities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

# spec/factories/communities.rb

FactoryGirl.define do
  factory :community do |f|
    f.name 'RVC'
    f.description 'Upper Valley based crossfitters'
  end
end
