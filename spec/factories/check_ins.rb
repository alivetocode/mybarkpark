# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :check_in do
    dog_id 1
    park_id 1
    check_out_at "2013-12-27 17:30:51"
  end
end
