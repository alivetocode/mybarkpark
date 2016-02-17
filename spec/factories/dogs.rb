# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dog do
    name "Mellon"
    breed "mixed"
    gender "female"
    color "cream"
    photo_url "photo_link"
    owner_id 1
    personality_attributes "very playful...never met a stranger"
  end
end
