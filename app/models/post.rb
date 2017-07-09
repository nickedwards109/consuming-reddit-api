class Post
  attr_accessor :title, :url, :score
  def initialize(attributes)
    @title = attributes[:title]
    @url = attributes[:url]
    @score = attributes[:score]
  end

  def self.set_all_post_attributes(subreddit_title, user)
    posts = RedditService.get_hot_posts(subreddit_title, user)
    posts.map do |post|
      new(title: post[:data][:title], url: post[:data][:url], score: post[:data][:score])
    end
  end
end
