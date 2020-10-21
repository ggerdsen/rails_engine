require 'rails_helper'

describe "Relationships" do
  it "Returns items belonging to a specified merchant" do
    merchant = create(:merchant)
    create_list(:item, 4, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

    merchant_items = JSON.parse(response.body, symbolize_names: true)
    expect(merchant_items[:data].count).to eq(4)
    expect(response).to be_success
  end


end