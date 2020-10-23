FactoryBot.define do
  factory :invoice do
    customer_id { 1 }
    merchant_id { 1 }
    status { "MyString" }
    created_at { "2020-10-17 18:07:57" }
    updated_at { "2020-10-17 18:07:57" }
  end
end
