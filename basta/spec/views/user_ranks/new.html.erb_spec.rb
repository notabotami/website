require 'rails_helper'

RSpec.describe "user_ranks/new", :type => :view do
  before(:each) do
    assign(:user_rank, UserRank.new())
  end

  it "renders new user_rank form" do
    render

    assert_select "form[action=?][method=?]", user_ranks_path, "post" do
    end
  end
end
