require 'rails_helper'

RSpec.describe "docker_cfgs/show", type: :view do
  before(:each) do
    @docker_cfg = assign(:docker_cfg, DockerCfg.create!(
      :url => "Url",
      :auth => "Auth",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Auth/)
    expect(rendered).to match(/Email/)
  end
end
