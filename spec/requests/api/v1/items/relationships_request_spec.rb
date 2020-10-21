require 'rails_helper'

describe "Relationships" do
  it "Returns the merchant that has a specified item" do
    item = create(:item)
    get "/api/v1/items/#{item.id}/merchant"
    json = JSON.parse(response.body, symbolize_names: true)
    expected_id = item.id

    expect(json[:data][:id]).to eq(item.merchant.id.to_s)
  end
end