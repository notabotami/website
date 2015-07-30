require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    %{
    assign(:user, User.new(
      :name => "MyString"
    ))
}
  end

  it "renders new user form" do
    pending "need to write test"
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_name[name=?]", "user[name]"
    end
  end
end
