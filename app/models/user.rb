class User < ApplicationRecord
  attr_accessor :username, :karma, :subreddits

  def set_attributes
    attributes = RedditService.get_attributes(self)
    self.username = attributes[:name]
    self.karma = attributes[:link_karma] + attributes[:comment_karma]
    subreddits = RedditService.get_subscribed_subreddits(self)
    self.subreddits = []
    subreddits.each do |subreddit|
      self.subreddits << Subreddit.new(title: subreddit[:data][:title],
                                       subscriber_count: subreddit[:data][:subscribers],
                                       description: subreddit[:data][:description])
    end
  end
end
