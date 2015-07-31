class UserRanks < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 1}, uniqueness: {message: "sorry, a user rank with this name already exists. try again."}
end
