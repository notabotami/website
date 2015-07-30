require 'faker'

FactoryGirl. define do
  pass = Faker::Internet.password
  factory :user do |f|
    f.first_name {Faker::Name.first_name}
    f.last_name {Faker::Name.last_name}
    f.user_id {Faker::Internet.user_name}
    f.password pass
    f.session_token {Faker::Internet.password}
    f.role "staff"
    f.email {Faker::Internet.free_email}
    #forcing password_confirmation to equal password
    f.password_confirmation pass
    f.phone_number {Faker::PhoneNumber.phone_number}
  end

  factory :owner, class: User do |f|
    f.first_name {Faker::Name.first_name}
    f.last_name {Faker::Name.last_name}
    f.user_id {Faker::Internet.user_name}
    f.password pass
    f.session_token {Faker::Internet.password}
    f.role "owner"
    f.email {Faker::Internet.free_email}
    #forcing password_confirmation to equal password
    f.password_confirmation pass
    f.phone_number {Faker::PhoneNumber.phone_number}
  end

  factory :manager, class: User do |f|
    f.first_name {Faker::Name.first_name}
    f.last_name {Faker::Name.last_name}
    f.user_id {Faker::Internet.user_name}
    f.password pass
    f.session_token {Faker::Internet.password}
    f.role "manager"
    f.email {Faker::Internet.free_email}
    #forcing password_confirmation to equal password
    f.password_confirmation pass
    f.phone_number {Faker::PhoneNumber.phone_number}
  end

  factory :staff, class: User do |f|
    f.first_name {Faker::Name.first_name}
    f.last_name {Faker::Name.last_name}
    f.user_id {Faker::Internet.user_name}
    f.password pass
    f.session_token {Faker::Internet.password}
    f.role "staff"
    f.email {Faker::Internet.free_email}
    #forcing password_confirmation to equal password
    f.password_confirmation pass
    f.phone_number {Faker::PhoneNumber.phone_number}
  end
end
