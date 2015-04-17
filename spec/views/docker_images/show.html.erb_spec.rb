require 'rails_helper'

RSpec.describe "docker_images/show", type: :view do
  before(:each) do
    @docker_image = assign(:docker_image, DockerImage.create!(
      :user_name => "User Name",
      :repository_name => "Repository Name",
      :user_id => "1"
    ))
    @user = assign(:user, User.create!(
      :name => "Name",
      :email => "a@b.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/Repository Name/)
    expect(rendered).to match(/User id/)
  end
end
