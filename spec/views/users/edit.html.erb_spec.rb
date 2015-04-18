require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :email => "a@b.com",
      :docker_cfg_id => 1
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

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_docker_cfg_id[name=?]", "user[docker_cfg_id]"
    end
  end
end
