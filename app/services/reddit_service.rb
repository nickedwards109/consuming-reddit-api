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
end
