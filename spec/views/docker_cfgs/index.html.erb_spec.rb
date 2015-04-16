require 'rails_helper'

RSpec.describe "docker_cfgs/index", type: :view do
  before(:each) do
    assign(:docker_cfgs, [
      DockerCfg.create!(
        :url => "Url",
        :auth => "Auth",
        :email => "Email"
      ),
      DockerCfg.create!(
        :url => "Url",
        :auth => "Auth",
        :email => "Email"
      )
    ])
  end

  it "renders a list of docker_cfgs" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Auth".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
