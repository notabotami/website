require 'rails_helper'

RSpec.describe "user_ranks/edit", :type => :view do
  before(:each) do
    @user_rank = assign(:user_rank, UserRank.create!())
  end

  it "renders the edit user_rank form" do
    render

    assert_select "form[action=?][method=?]", user_rank_path(@user_rank), "post" do
    end
  end
end
