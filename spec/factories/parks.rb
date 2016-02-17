# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :park do
    name "Happy dog park"
    address "123 Main Street"
    city "Dogville"
    state "NC"
    zip_code "27523"
    photo_url "url to park photo"
    description "5 acre park with large/med/small dog areas."
  end
end
