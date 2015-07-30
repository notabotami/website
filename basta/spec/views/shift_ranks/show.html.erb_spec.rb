require 'rails_helper'

RSpec.describe "shift_ranks/show", :type => :view do
  before(:each) do
    @shift_rank = assign(:shift_rank, ShiftRank.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
