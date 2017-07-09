class Post
  attr_accessor :title, :url
  def initialize(attributes)
    @title = attributes[:title]
    @url = attributes[:url]
  end

  def self.set_all_post_attributes(subreddit_title, user)
    posts = RedditService.get_hot_posts(subreddit_title, user)
    posts.map do |post|
      new(title: post[:data][:title], url: post[:data][:url])
    end
  end
end
