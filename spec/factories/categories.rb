FactoryGirl.define do
  factory :category do
    name { Faker::Name.name }
    parent_id { Faker::Number.between(1, 20) }
  end
end
