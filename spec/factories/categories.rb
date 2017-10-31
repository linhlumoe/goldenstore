FactoryGirl.define do
  factory :category do
    name { Faker::Name.name }
    name_path { Faker::Name.name }
    id_path {Faker::Number.number(5) + ' > ' + Faker::Number.number(5)}
    external_id {Faker::Number.number(5)}
  end
end
