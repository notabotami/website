require 'rails_helper'

RSpec.describe "user_ranks/show", :type => :view do
  before(:each) do
    @user_rank = assign(:user_rank, UserRank.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
