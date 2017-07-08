class RedditService
  def self.get_attributes(user)
    identity_connection = Faraday.new(url: 'https://oauth.reddit.com/api/v1/me')
    identity_connection.headers['Authorization'] = "bearer #{user.access_token}"
    response = identity_connection.get
    identity_json = JSON.parse(response.body, symbolize_names: true)
  end
end
