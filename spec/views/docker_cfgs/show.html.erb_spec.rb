require 'rails_helper'

RSpec.describe "docker_cfgs/show", type: :view do
  before(:each) do
    @docker_cfg = assign(:docker_cfg, DockerCfg.create!(
      :url => "Url",
      :auth => "Auth",
      :email => "a@b.com"
    ))
    def view.is_admin?
      true
    end
    def view.current_user
      user = User.new(name: "Name", email: "a@b.com")
      user.save
      user
    end
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Auth/)
    expect(rendered).to match(/Email/)
  end
end
