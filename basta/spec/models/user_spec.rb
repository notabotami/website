require 'spec_helper'
require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it 'is invalid without a user_id' do
    expect(FactoryGirl.build(:user,user_id: nil)).not_to be_valid
  end
  it 'is invalid without a password' do
    expect(FactoryGirl.build(:user,password: nil)).not_to be_valid
  end
  it 'is invalid without a password_confirmation' do
    expect(FactoryGirl.build(:user,password_confirmation: nil)).not_to be_valid
  end
  it 'is invalid without a role' do
      expect(FactoryGirl.build(:user,role: nil)).not_to be_valid
  end
  it 'is invalid without a session_token' do
    expect(FactoryGirl.build(:user,session_token: nil)).not_to be_valid
  end
  it 'is invalid without a first_name' do
    expect(FactoryGirl.build(:user,first_name: nil)).not_to be_valid
  end
  it 'is invalid without a last_name' do
    expect(FactoryGirl.build(:user,last_name: nil)).not_to be_valid
  end
  it 'is valid without any other information e.g. (email,first_name,...)' do
    expect(FactoryGirl.build(:user, email: nil, phone_number: nil)).to be_valid
  end
end
