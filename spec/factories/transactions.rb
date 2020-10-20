FactoryBot.define do
  factory :transaction do
    csv_id { 1 }
    invoice_id { 1 }
    credit_card_number { "" }
    credit_card_expiration_date { "2020-10-17" }
    result { "MyString" }
    created_at { "2020-10-17 18:30:24" }
    updated_at { "2020-10-17 18:30:24" }
  end
end
