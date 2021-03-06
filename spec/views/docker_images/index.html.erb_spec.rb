require 'rails_helper'

RSpec.describe "docker_images/index", type: :view do
  before(:each) do
    assign(:docker_images, [
      DockerImage.create!(
        :user_name => "User Name",
        :repository_name => "Repository Name"
      ),
      DockerImage.create!(
        :user_name => "User Name",
        :repository_name => "Repository Name"
      )
    ])
    def view.is_admin?
      true
    end
    def view.current_user
      user = User.new(name: "Name", email: "a@b.com")
      user.save
      user
    end
  end

  it "renders a list of docker_images" do
    render
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Repository Name".to_s, :count => 2
  end
end
