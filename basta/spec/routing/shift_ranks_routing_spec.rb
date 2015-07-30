require "rails_helper"

RSpec.describe ShiftRanksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shift_ranks").to route_to("shift_ranks#index")
    end

    it "routes to #new" do
      expect(:get => "/shift_ranks/new").to route_to("shift_ranks#new")
    end

    it "routes to #show" do
      expect(:get => "/shift_ranks/1").to route_to("shift_ranks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shift_ranks/1/edit").to route_to("shift_ranks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shift_ranks").to route_to("shift_ranks#create")
    end

    it "routes to #update" do
      expect(:put => "/shift_ranks/1").to route_to("shift_ranks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shift_ranks/1").to route_to("shift_ranks#destroy", :id => "1")
    end

  end
end
