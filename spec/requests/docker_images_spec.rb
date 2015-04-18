require 'rails_helper'

RSpec.describe "DockerImages", type: :request do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:is_admin?).and_return(true)
  end
  describe "GET /docker_images" do
    it "works! (now write some real specs)" do
      get docker_images_path
      expect(response).to have_http_status(200)
    end
  end
end
