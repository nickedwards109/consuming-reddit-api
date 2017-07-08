require 'rails_helper'

RSpec.describe RedditService do
  it "gets a user's attributes" do
    VCR.use_cassette("reddit_service.get_user_attributes") do
      raw_attributes = RedditService.get_user_attributes

      expect(raw_attributes).to be_a Hash
      expect(raw_attributes).to have_key(:username)
      expect(raw_attributes[:username]).to be_a String
      expect(raw_attributes).to have_key(:karma)
      expect(raw_attributes[:karma]).to be_a Integer
    end
  end
end
