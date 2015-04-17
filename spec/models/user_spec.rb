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
    it "expects an invalide user" do
      user1 = User.new(name: "name", email: "a@b.com")
      user1.save
      user2 = User.new(name: "name2", email: "a@b.com")
      expect(user2).to_not be_valid
    end
  end
end
