require 'faker'
FactoryGirl.define do
  factory :shift do |f|
    f.date DateTime.new(2001,2,3,4,5,6)
    f.section {Faker::Lorem.characters(3)}
    f.user_id {Faker::Number.number(2)}
  end

end
