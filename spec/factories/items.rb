FactoryBot.define do
  factory :item do
    csv_id { 1 }
    name { "MyString" }
    description { "MyString" }
    unit_price { 1 }
    merchant_id { 1 }
    created_at { "2020-10-17 18:11:08" }
    updated_at { "2020-10-17 18:11:08" }
  end
end
