require 'rails_helper'

RSpec.feature "Subreddit" do
  it "displays a subreddit's title, number of subscribers, description, and top
      15 posts" do
    user_mock = User.create(access_token: "mocktoken1a81jv0ck4")
    user_mock.username = "RedditUserName"
    user_mock.karma = 16
    subreddit = Subreddit.new(title: "programming",
                              subscriber_count: 800000,
                              description: "Programming Subreddit Description")
    user_mock.subreddits = []
    user_mock.subreddits << subreddit
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_mock)

    visit "/"
    VCR.use_cassette("reddit_service.get_hot_posts") do
    # This content comes from the VCR cassette. If Capybara is confused and you have
    # changed the cassette recently, you will need to update this to match the content
    # in the cassette.
    click_on "programming"
    expect(page).to have_selector(".subreddit-title")
    expect(page).to have_content("programming")
    expect(page).to have_selector(".subscriber-count")
    expect(page).to have_content("800000")
    expect(page).to have_selector(".description")
    expect(page).to have_content("Programming Subreddit Description")

    expect(page).to have_selector(".posts")
    within(".posts") do
      expect(page).to have_selector(".post", count: 15)
      expect(page).to have_link("Seven useful habits for programmers")
      expect(page).to have_selector(".score")
      expect(page).to have_content("329")
    end
  end
  end
end
