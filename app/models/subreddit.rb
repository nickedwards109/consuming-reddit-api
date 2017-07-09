class Subreddit
  attr_reader :title, :subscriber_count, :description
  def initialize(attributes)
    @title = attributes[:title]
    @subscriber_count = attributes[:subscriber_count]
    @description = attributes[:description]
  end
end
