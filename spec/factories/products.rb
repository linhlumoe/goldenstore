FactoryGirl.define do
  factory :product do
    title { Faker::Book.title }
    brand { Faker::Book.publisher }
    author { Faker::Book.author }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.decimal(2).to_f }
    image {}
    category
    stock { Faker::Number.between(10, 50) }
  end
end
