require 'rails_helper'

RSpec.describe RedditService do
  it "gets a user's basic attributes" do
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

  it "gets a user's list of subscribed subreddits" do
    user = User.create(access_token: ENV['test_access_token'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("reddit_service.get_subscribed_subreddits") do
      raw_subreddits = RedditService.get_subscribed_subreddits(user)

      expect(raw_subreddits).to be_an Array
      expect(raw_subreddits.first).to be_a Hash
      expect(raw_subreddits.first).to have_key(:data)
      expect(raw_subreddits.first[:data]).to be_a Hash
      expect(raw_subreddits.first[:data]).to have_key(:title)
      expect(raw_subreddits.first[:data][:title]).to be_a String
      expect(raw_subreddits.first[:data]).to have_key(:description)
      expect(raw_subreddits.first[:data][:description]).to be_a String
      expect(raw_subreddits.first[:data]).to have_key(:subscribers)
      expect(raw_subreddits.first[:data][:subscribers]).to be_an Integer
    end
  end

  it "gets a subreddit's top posts" do
    user = User.create(access_token: ENV['test_access_token'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    subreddit_title = "programming"

    VCR.use_cassette("reddit_service.get_hot_posts") do
      raw_posts = RedditService.get_hot_posts(subreddit_title, user)

      expect(raw_posts).to be_an Array
      expect(raw_posts.first).to be_a Hash
      expect(raw_posts.first).to have_key(:data)
      expect(raw_posts.first[:data]).to be_a Hash
      expect(raw_posts.first[:data]).to have_key(:title)
      expect(raw_posts.first[:data][:title]).to be_a String
      expect(raw_posts.first[:data]).to have_key(:url)
      expect(raw_posts.first[:data][:url]).to be_a String
    end
  end
end
