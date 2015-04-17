require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "a@b.com",
        :docker_cfg_id => 1
      ),
      User.create!(
        :name => "Name",
        :email => "b@c.com",
        :docker_cfg_id => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "a@b.com".to_s, :count => 1
    assert_select "tr>td", :text => "b@c.com".to_s, :count => 1
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
