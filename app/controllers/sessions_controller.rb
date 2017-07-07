class SessionsController < ApplicationController
  def create
    connection = Faraday.new(url: 'https://www.reddit.com/api/v1/access_token')
    connection.basic_auth(ENV['client_id'], ENV['client_secret'])
    response = connection.post("https://www.reddit.com/api/v1/access_token",
                               :grant_type => "authorization_code",
                               :code => params[:code],
                               :redirect_uri => "http://localhost:3000/reddit/callback/")
    response_json = JSON.parse(response.body)

    access_token = response_json["access_token"]
  end
end
