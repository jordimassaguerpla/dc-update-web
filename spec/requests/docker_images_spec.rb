require 'rails_helper'

RSpec.describe "DockerImages", type: :request do
  describe "GET /docker_images" do
    it "works! (now write some real specs)" do
      get docker_images_path
      expect(response).to have_http_status(200)
    end
  end
end
