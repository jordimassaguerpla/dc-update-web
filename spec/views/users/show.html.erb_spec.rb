require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :url => "Url",
      :auth => "Auth",
      :email => "Email",
      :docker_cfg_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Auth/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
  end
end
