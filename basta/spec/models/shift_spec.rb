require 'rails_helper'

RSpec.describe Shift, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:shift)).to be_valid
  end
  it "is invalid without a section" do
    expect(FactoryGirl.build(:shift,section: nil)).not_to be_valid
  end
  it "is invalid without a date" do
    expect(FactoryGirl.build(:shift,date: nil)).not_to be_valid
  end
  it "is invalid without a user_id" do
    expect(FactoryGirl.build(:shift,user_id: nil)).not_to be_valid
  end

end
