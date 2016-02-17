# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "Cinda"
    last_name "Rella"
    city "Enchantment"
    state "NC"
    photo_url "myphoto"
    email "cinda@email.com"
    password "mypassword"
  end
end
