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
  
  it "Merchant create" do
    merchant_params = {name: "REI" }
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
  
  it "Merchant destroy" do
    merchant = create(:merchant)
    
    expect(Merchant.count).to eq(1)

    delete "/api/v1/merchants/#{merchant.id}"
    
    expect(response).to be_successful
    expect(Merchant.count).to eq(0)
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
  
  it "Merchant update" do
    id = create(:merchant).id
    previous_name = Merchant.last.name
    merchant_params = {name: "Big 5 Sports"}
    headers = {"CONTENT_TYPE" => "application/json"}

    # We include this header to make sure that these params are passed as JSON rather than as plain text
    put "/api/v1/merchants/#{id}", params: JSON.generate(merchant_params), headers: headers
    merchant = Merchant.find_by(id: id)

    expect(response).to be_successful
    expect(merchant.name).to_not eq(previous_name)
    expect(merchant.name).to eq("Big 5 Sports")
  end
end