require 'rails_helper'

RSpec.describe "docker_images/new", type: :view do
  before(:each) do
    assign(:docker_image, DockerImage.new(
      :user_name => "MyString",
      :repository_name => "MyString"
    ))
  end

  it "renders new docker_image form" do
    render

    assert_select "form[action=?][method=?]", docker_images_path, "post" do

      assert_select "input#docker_image_user_name[name=?]", "docker_image[user_name]"

      assert_select "input#docker_image_repository_name[name=?]", "docker_image[repository_name]"
    end
  end
end
