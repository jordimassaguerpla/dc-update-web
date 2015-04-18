require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :email => "a@b.com",
      :docker_cfg_id => 1
    ))
    @docker_cfg = assign(:docker_cfg, DockerCfg.create!(
      :url => "URL",
      :auth => "AUTH",
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
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/a@b.com/)
    expect(rendered).to match(/1/)
  end
end
