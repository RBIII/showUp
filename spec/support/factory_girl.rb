require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :venue do
    sequence(:name) { |n| "Brighton Music Hall - #{n}"}
    latitude "40.77167"
    longitude "-73.99277"
  end

  factory :band do
    sequence(:name) { |n| "Foo Fighters - #{n}" }
  end

  factory :show do
    date "2015-04-13"
    time "19:00:00"
    venue
    band
  end
end
