require 'rails_helper'

RSpec.describe DockerImage, type: :model do
  context "with user_name and repository_name" do
    it "expects to be valid" do
      di = DockerImage.new(user_name: "username", repository_name: "reponame")
      expect(di).to be_valid
    end
    it "expects full_name to concatenate user_name and repository_name" do
      di = DockerImage.new(user_name: "username", repository_name: "reponame")
      expect(di.full_name).to eq("username/reponame")
    end
  end
  context "with no user_name" do
    it "expects to be invalid" do
      di = DockerImage.new(repository_name: "reponame")
      expect(di).to_not be_valid
    end
  end
  context "with no repository_name" do
    it "expects to be invalid" do
      di = DockerImage.new(user_name: "username")
      expect(di).to_not be_valid
    end
  end
end
