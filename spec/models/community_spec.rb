# spec/models/community.rb

require 'spec_helper'

describe Community do
  it 'has a valid factory' do
    community = FactoryGirl.create(:community)
    expect(community).to be_valid
  end
  it 'is invalid without a name' do
    community = FactoryGirl.build(:community, name: nil)
    expect(community).to_not be_valid
  end
  it 'is invalid without description' do
    community = FactoryGirl.build(:community, description: nil)
    expect(community).to_not be_valid
  end
  it 'is invalid with a description greater than 160 characters' do
    description = 'jkafdkanfandlfnajkdsnfkljandjfnakjdnfkajdnfjknadjfnajlkjanfkjdn
      adnjkjandflkandlkjfnadkljnfalkjndfljkandsfkjandkjfnakdsjnfjkandlfkjandjkn
      akfdjnaldkakjnfdkjandjkfnakjdnfakjldnfljkandljkfnad'
    community = FactoryGirl.build(:community, description: description)
    expect(community).to_not be_valid
  end
end
