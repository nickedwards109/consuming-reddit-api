require 'rails_helper'

RSpec.describe RedditService do
  it "gets a user's attributes" do
    user = User.create(access_token: ENV['test_access_token'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("reddit_service.get_user_attributes") do
      raw_attributes = RedditService.get_attributes(user)

      expect(raw_attributes).to be_a Hash
      expect(raw_attributes).to have_key(:name)
      expect(raw_attributes[:name]).to be_a String
      expect(raw_attributes).to have_key(:link_karma)
      expect(raw_attributes[:link_karma]).to be_a Integer
      expect(raw_attributes).to have_key(:comment_karma)
      expect(raw_attributes[:comment_karma]).to be_a Integer
    end
  end
end
