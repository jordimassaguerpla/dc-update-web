require "rails_helper"

RSpec.describe DockerImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/docker_images").to route_to("docker_images#index")
    end

    it "routes to #new" do
      expect(:get => "/docker_images/new").to route_to("docker_images#new")
    end

    it "routes to #show" do
      expect(:get => "/docker_images/1").to route_to("docker_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/docker_images/1/edit").to route_to("docker_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/docker_images").to route_to("docker_images#create")
    end

    it "routes to #update" do
      expect(:put => "/docker_images/1").to route_to("docker_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/docker_images/1").to route_to("docker_images#destroy", :id => "1")
    end

  end
end
