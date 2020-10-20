FactoryBot.define do
  factory :merchant do
    name { Faker::Company.name }
    created_at {Faker::Date.between(from: '2010-01-01', to: '2020-10-01')}
    updated_at {Faker::Date.between(from: '2010-01-01', to: '2020-10-01')}
  end
end
