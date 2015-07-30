require 'rails_helper'

RSpec.describe "shift_ranks/index", :type => :view do
  before(:each) do
    assign(:shift_ranks, [
      ShiftRank.create!(),
      ShiftRank.create!()
    ])
  end

  it "renders a list of shift_ranks" do
    render
  end
end
