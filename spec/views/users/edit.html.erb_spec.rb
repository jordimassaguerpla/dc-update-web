require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :url => "MyString",
      :auth => "MyString",
      :email => "MyString",
      :docker_cfg_id => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_url[name=?]", "user[url]"

      assert_select "input#user_auth[name=?]", "user[auth]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_docker_cfg_id[name=?]", "user[docker_cfg_id]"
    end
  end
end
