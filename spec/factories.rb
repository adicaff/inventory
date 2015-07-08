FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password  Faker::Internet.password(8)
  end

  factory :item do
    name Faker::Name.name
    description Faker::Lorem.sentence
    location Faker::Lorem.words
  end
end