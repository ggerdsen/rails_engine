require 'rails_helper'

describe "Search endpoints" do
  it 'can find a list of merchants that contain a fragment, case insensitive' do
    merchant_1 = create(:merchant, name: "Williams Co")
    merchant_2 = create(:merchant, name: "Car Dealership")
    merchant_3 = create(:merchant, name: "Bakery")
    
    get "/api/v1/merchants/find_all?name=ILL"
    expect(response).to be_success
    merchants = JSON.parse(response.body, symbolize_names: true)

    names = merchants[:data].map do |merchant|
      merchant[:attributes][:name]
    end

    expect(names.sort).to eq(["Williams Co"])
  end
  
  it 'can find a merchant that contain a fragment, case insensitive' do
    merchant_1 = create(:merchant, name: "Williams Co")
    merchant_2 = create(:merchant, name: "Car Dealership")
    merchant_3 = create(:merchant, name: "Bakery")
    
    get "/api/v1/merchants/find?name=ILL"
    expect(response).to be_success
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data][:attributes][:name]).to eq("Williams Co")
  end
end