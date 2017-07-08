require 'rails_helper'

RSpec.feature "Front Page" do
  it "displays the user's username, karma, and subscribed subreddits" do
    visit "/"
    expect(page).to have_content "Login"

    user_mock = User.create(access_token: "mocktoken1a81jv0ck4")
    user_mock.username = "RedditUserName"
    user_mock.karma = 16
    subreddit = Subreddit.new(title: "programming")
    user_mock.subreddits = []
    user_mock.subreddits << subreddit
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_mock)

    visit "/"
    expect(page).to have_selector(".subscribed-subreddits")
    within(".subscribed-subreddits") do
      expect(page).to have_content("programming")
    end
    expect(page).to have_selector(".username")
    expect(page).to have_content("RedditUserName")
    expect(page).to have_selector(".karma")
    expect(page).to have_content("16")
    expect(page).to have_selector(".inbox")
    expect(page).to have_content("Logout")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
    click_on "Logout"
    expect(page).to have_content("Login")
  end
end
