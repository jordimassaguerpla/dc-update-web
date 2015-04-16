require "rails_helper"

RSpec.describe DockerCfgsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/docker_cfgs").to route_to("docker_cfgs#index")
    end

    it "routes to #new" do
      expect(:get => "/docker_cfgs/new").to route_to("docker_cfgs#new")
    end

    it "routes to #show" do
      expect(:get => "/docker_cfgs/1").to route_to("docker_cfgs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/docker_cfgs/1/edit").to route_to("docker_cfgs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/docker_cfgs").to route_to("docker_cfgs#create")
    end

    it "routes to #update" do
      expect(:put => "/docker_cfgs/1").to route_to("docker_cfgs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/docker_cfgs/1").to route_to("docker_cfgs#destroy", :id => "1")
    end

  end
end
