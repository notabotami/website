require 'rails_helper'

RSpec.describe "ShiftRanks", :type => :request do
  describe "GET /shift_ranks" do
    it "works! (now write some real specs)" do
      get shift_ranks_path
      expect(response).to have_http_status(200)
    end
  end
end
