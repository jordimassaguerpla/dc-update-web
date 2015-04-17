require 'rails_helper'

RSpec.describe "docker_cfgs/edit", type: :view do
  before(:each) do
    @docker_cfg = assign(:docker_cfg, DockerCfg.create!(
      :url => "MyString",
      :auth => "MyString",
      :email => "a@b.com"
    ))
  end

  it "renders the edit docker_cfg form" do
    render

    assert_select "form[action=?][method=?]", docker_cfg_path(@docker_cfg), "post" do

      assert_select "input#docker_cfg_url[name=?]", "docker_cfg[url]"

      assert_select "input#docker_cfg_auth[name=?]", "docker_cfg[auth]"

      assert_select "input#docker_cfg_email[name=?]", "docker_cfg[email]"
    end
  end
end
