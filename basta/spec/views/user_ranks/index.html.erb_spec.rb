require 'rails_helper'

RSpec.describe "user_ranks/index", :type => :view do
  before(:each) do
    assign(:user_ranks, [
      UserRank.create!(),
      UserRank.create!()
    ])
  end

  it "renders a list of user_ranks" do
    render
  end
end
