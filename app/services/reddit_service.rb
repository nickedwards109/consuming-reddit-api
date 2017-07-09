class RedditService
  def self.get_attributes(user)
    identity_connection = Faraday.new(url: 'https://oauth.reddit.com/api/v1/me')
    identity_connection.headers['Authorization'] = "bearer #{user.access_token}"
    response = identity_connection.get
    identity_json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_subscribed_subreddits(user)
    subreddits_connection = Faraday.new(url: 'https://oauth.reddit.com/subreddits/mine/subscriber')
    subreddits_connection.headers['Authorization'] = "bearer #{user.access_token}"
    response = subreddits_connection.get
    subreddits_json = JSON.parse(response.body, symbolize_names: true)
    subreddits_json[:data][:children]
  end

  def self.get_hot_posts(subreddit_title, user)
    hot_posts_connection = Faraday.new(url: "https://oauth.reddit.com/r/#{subreddit_title}/hot?limit=15")
    hot_posts_connection.headers['Authorization'] = "bearer #{user.access_token}"
    response = hot_posts_connection.get
    hot_posts_json = JSON.parse(response.body, symbolize_names: true)
    hot_posts_json[:data][:children]
  end
end
