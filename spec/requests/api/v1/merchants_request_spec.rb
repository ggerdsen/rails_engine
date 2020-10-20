require 'rails_helper'

describe "Rails Engine" do
  it "Merchant index" do
    create_list(:merchant, 3)
    get '/api/v1/merchants'

    expect(response).to be_successful
    expect(response.content_type).to eq("application/json")
    
    merchants = JSON.parse(response.body, symbolize_names: true)
    expect(merchants[:data].first).to have_key(:id)
    expect(merchants[:data].first).to have_key(:attributes)
    expect(merchants[:data].first[:attributes]).to have_key(:name)
  end
  
  it "Merchant show" do
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful
    expect(response.content_type).to eq("application/json")
    
    merchant = JSON.parse(response.body, symbolize_names: true)
    expect(merchant[:data]).to have_key(:id)
    expect(merchant[:data]).to have_key(:attributes)
    expect(merchant[:data][:attributes]).to have_key(:name)
  end
  
  it "Merchant create and destroy" do
    merchant_params = { name: "Wilderness Exchange" }
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/merchants", params: JSON.generate(merchant_params), headers: headers
    
    expect(response).to be_successful
    expect(response.content_type).to eq("application/json")

    merchant = Merchant.last
    
    expect(merchant.name).to eq(merchant_params[:name])

    merchant_json = JSON.parse(response.body, symbolize_names: true)
    expect(merchant_json[:data][:id]).to eq(merchant.id.to_s)
    expect(merchant_json[:data][:type]).to eq("merchant")
    expect(merchant_json[:data][:attributes][:name]).to eq(merchant_params[:name])
    
  end
end