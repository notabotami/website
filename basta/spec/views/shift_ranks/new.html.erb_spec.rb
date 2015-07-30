require 'rails_helper'

RSpec.describe "shift_ranks/new", :type => :view do
  before(:each) do
    assign(:shift_rank, ShiftRank.new())
  end

  it "renders new shift_rank form" do
    render

    assert_select "form[action=?][method=?]", shift_ranks_path, "post" do
    end
  end
end
