require 'rails_helper'

RSpec.feature "Front Page" do
  it "displays the user's username and karma" do
    visit "/"
    expect(page).to have_content "Login"

    user_mock = User.create(access_token: "mocktoken1a81jv0ck4")
    user_mock.username = "RedditUserName"
    user_mock.karma = 16
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_mock)

    visit "/"
    expect(page).to have_selector(".username")
    expect(page).to have_content("RedditUserName")
    expect(page).to have_selector(".karma")
    expect(page).to have_content("16")
    expect(page).to have_selector(".inbox")
    expect(page).to have_content("Logout")
  end
end
