FactoryBot.define do
  factory :item do
    name { Faker::Beer.brand }
    description { Faker::Beer.name }
    unit_price { Faker::Number.decimal(l_digits: 2) }
    merchant
    created_at { Faker::Date.between(from: '2010-01-01', to: '2020-01-01') }
    updated_at { Faker::Date.between(from: '2020-09-01', to: '2020-10-20') }
  end
end
