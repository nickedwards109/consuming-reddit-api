require 'rails_helper'
require './spec/helpers/spec_helper_methods'
include SpecHelpers

RSpec.feature "Front Page" do
  before(:each) do
    user_mock = User.create(username: "RedditUserName", access_token: "mocktoken1a81jv0ck4")
    user_mock.karma = 16
    user_mock.save
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_mock)
  end

  it "displays the user's username and karma" do
    visit "/"
    expect(page).to have_selector(".username")
    expect(page).to have_content("RedditUserName")
    expect(page).to have_selector(".karma")
    expect(page).to have_content("16")
    expect(page).to have_selector(".inbox")
    expect(page).to have_selector(".logout")
  end
end
