require 'rails_helper'

RSpec.describe DockerCfg, type: :model do
  context "with url, auth, email" do
    it "expects a valid docker cfg" do
      dc = DockerCfg.new(url: "http://a.b.com", auth: "asdfasdf", email: "a@b.com")
      expect(dc).to be_valid
    end
  end
  context "with no url" do
    it "expects to be invalid" do
      dc = DockerCfg.new(auth: "asdfasdf", email: "a@b.com")
      expect(dc).to_not be_valid
    end
  end
  context "with no auth" do
    it "expects to be invalid" do
      dc = DockerCfg.new(url: "http://a.b.com", email: "a@b.com")
      expect(dc).to_not be_valid
    end
  end
  context "with no email" do
    it "expects to be invalid" do
      dc = DockerCfg.new(url: "http://a.b.com", auth: "asdfasdf")
      expect(dc).to_not be_valid
    end
  end
  context "with invalid email" do
    it "expects to be invalid" do
      dc = DockerCfg.new(url: "http://a.b.com", auth: "asdfasdf", email: "not valid")
      expect(dc).to_not be_valid
    end
  end
end
