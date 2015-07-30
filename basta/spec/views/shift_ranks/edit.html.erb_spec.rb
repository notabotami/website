require 'rails_helper'

RSpec.describe "shift_ranks/edit", :type => :view do
  before(:each) do
    @shift_rank = assign(:shift_rank, ShiftRank.create!())
  end

  it "renders the edit shift_rank form" do
    render

    assert_select "form[action=?][method=?]", shift_rank_path(@shift_rank), "post" do
    end
  end
end
