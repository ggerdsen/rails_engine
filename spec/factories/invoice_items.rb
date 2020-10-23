FactoryBot.define do
  factory :invoice_item do
    item_id { 1 }
    invoice_id { 1 }
    quantity { 1 }
    unit_price { 1 }
    created_at { "2020-10-17 18:03:46" }
    updated_at { "2020-10-17 18:03:46" }
  end
end
