require 'rails_helper'

RSpec.describe User, type: :model do
  it "has an access_token attribute in the database, as well as other attributes" do
    user = User.create(access_token: "mocktoken1a81jv0ck4")
    expect(user).to be_valid
    expect(user).to respond_to(:username)
    expect(user).to respond_to(:karma)
  end
end
