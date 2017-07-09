require 'rails_helper'

RSpec.feature "Subreddit" do
  it "displays a subreddit's title, number of subscribers, description, and rules" do
    user_mock = User.create(access_token: "mocktoken1a81jv0ck4")
    user_mock.username = "RedditUserName"
    user_mock.karma = 16
    subreddit = Subreddit.new(title: "programming",
                              subscriber_count: 800000,
                              description: "Programming Subreddit Description",
                              rules: "These are the rules.")
    user_mock.subreddits = []
    user_mock.subreddits << subreddit
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_mock)

    visit "/"
    click_on "programming"
    expect(page).to have_selector(".title")
    expect(page).to have_content("programming")
    expect(page).to have_selector(".subscriber-count")
    expect(page).to have_content("800000")
    expect(page).to have_selector(".description")
    expect(page).to have_content("Programming Subreddit Description")
    expect(page).to have_selector(".rules")
    expect(page).to have_content("These are the rules")
  end
end
