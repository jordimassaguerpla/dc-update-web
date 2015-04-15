require 'rails_helper'

RSpec.describe "docker_images/edit", type: :view do
  before(:each) do
    @docker_image = assign(:docker_image, DockerImage.create!(
      :user_name => "MyString",
      :repository_name => "MyString"
    ))
  end

  it "renders the edit docker_image form" do
    render

    assert_select "form[action=?][method=?]", docker_image_path(@docker_image), "post" do

      assert_select "input#docker_image_user_name[name=?]", "docker_image[user_name]"

      assert_select "input#docker_image_repository_name[name=?]", "docker_image[repository_name]"
    end
  end
end
