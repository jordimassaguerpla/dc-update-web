require 'rails_helper'

RSpec.describe "docker_cfgs/new", type: :view do
  before(:each) do
    assign(:docker_cfg, DockerCfg.new(
      :url => "MyString",
      :auth => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new docker_cfg form" do
    render

    assert_select "form[action=?][method=?]", docker_cfgs_path, "post" do

      assert_select "input#docker_cfg_url[name=?]", "docker_cfg[url]"

      assert_select "input#docker_cfg_auth[name=?]", "docker_cfg[auth]"

      assert_select "input#docker_cfg_email[name=?]", "docker_cfg[email]"
    end
  end
end
