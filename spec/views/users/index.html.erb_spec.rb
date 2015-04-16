require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :url => "Url",
        :auth => "Auth",
        :email => "Email",
        :docker_cfg_id => 1
      ),
      User.create!(
        :url => "Url",
        :auth => "Auth",
        :email => "Email",
        :docker_cfg_id => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Auth".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
