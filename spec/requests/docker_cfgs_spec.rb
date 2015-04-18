require 'rails_helper'

RSpec.describe "DockerCfgs", type: :request do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:is_admin?).and_return(true)
  end
  describe "GET /docker_cfgs" do
    it "works! (now write some real specs)" do
      get docker_cfgs_path
      expect(response).to have_http_status(200)
    end
  end
end
