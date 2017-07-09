class Subreddit
  attr_accessor :title, :subscriber_count, :description, :posts
  def initialize(attributes)
    @title = attributes[:title]
    @subscriber_count = attributes[:subscriber_count]
    @description = attributes[:description]
    @posts = attributes[:posts]
  end
end
