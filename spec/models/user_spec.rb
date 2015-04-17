require 'rails_helper'

RSpec.describe User, type: :model do
  context "with valid user and valid email" do
    it "expects a valid user" do
      user = User.new(name: "Name", email: "a@b.com")
      expect(user).to be_valid
    end
  end
  context "with invalid email" do
    it "expects an invalid user" do
      user = User.new(name: "Name", email: "invalid_email")
      expect(user).to_not be_valid
    end
  end
  context "with no email" do
    it "expects an invalid user" do
      user = User.new(name: "Name")
      expect(user).to_not be_valid
    end
  end
  context "with no name" do
    it "expects an invalid user" do
      user = User.new(email: "Name")
      expect(user).to_not be_valid
    end
  end
  context "2 with the same email" do
    it "expects an invalid user" do
      user1 = User.new(name: "name", email: "a@b.com")
      user1.save
      user2 = User.new(name: "name2", email: "a@b.com")
      expect(user2).to_not be_valid
    end
  end
  context "login with omniauth" do
    it "expects creating a new user" do
      auth = { "provider" => "provider", "uid" => "uid", "info" => { "nickname" => "name", "email" => "a@b.com" } }
      expect {
        User.from_omniauth(auth)
      }.to change(User, :count).by(1)
     
    end
    it "expects getting existing user" do
      auth = { "provider" => "provider", "uid" => "uid2", "info" => { "nickname" => "name", "email" => "b@c.com" } }
      expect {
        User.from_omniauth(auth)
      }.to change(User, :count).by(1)
     
      auth = { "provider" => "provider", "uid" => "uid2", "info" => { "nickname" => "name", "email" => "b@c.com" } }
      expect {
        User.from_omniauth(auth)
      }.to_not change(User, :count)
    end
  end
end
