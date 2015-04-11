require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :venue do
    sequence(:name) { |n| "Brighton Music Hall - #{n}"}
    location "40.77167, -73.99277"
  end

end
