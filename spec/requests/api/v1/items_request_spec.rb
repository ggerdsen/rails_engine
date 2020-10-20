require 'rails_helper'

describe "Items CRUD Functionality" do
  it "Item index" do
    item = create_list(:item, 3)
    get '/api/v1/items'

    expect(response).to be_successful
    expect(response.content_type).to eq("application/json")
    
    items = JSON.parse(response.body, symbolize_names: true)
    expect(items[:data].first).to have_key(:id)
    expect(items[:data].first).to have_key(:attributes)
    expect(items[:data].first[:attributes]).to have_key(:name)
  end
  
  it "Item show" do
    item = create(:item)
    get "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(response.content_type).to eq("application/json")
    
    item = JSON.parse(response.body, symbolize_names: true)
    expect(item[:data]).to have_key(:id)
    expect(item[:data]).to have_key(:attributes)
    expect(item[:data][:attributes]).to have_key(:name)
  end
  
  it "Item create" do
    merchant = create(:merchant)
    item_params = {name: "Hiking Boots",
                   description: "Lace up boots",
                   unit_price: 99.88,
                   merchant_id: merchant.id
                   }
    headers = { "CONTENT_TYPE" => "application/json" }
  
    post "/api/v1/items", params: JSON.generate(item_params), headers: headers
  
    expect(response).to be_successful
    expect(response.content_type).to eq("application/json")
  
    item = Item.last

    expect(item.name).to eq(item_params[:name])
  
    merchant_json = JSON.parse(response.body, symbolize_names: true)
  
    expect(merchant_json[:data][:id]).to eq(item.id.to_s)
    expect(merchant_json[:data][:type]).to eq("item")
    expect(merchant_json[:data][:attributes][:name]).to eq(item_params[:name])
  end
  
  it "Item destroy" do
    item = create(:item)
  
    expect(Item.count).to eq(1)
  
    delete "/api/v1/items/#{item.id}"
  
    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
  
  it "Item update" do
    id = create(:item).id
    previous_name = Item.last.name
    item_params = {name: "Big 5 Sports"}
    headers = {"CONTENT_TYPE" => "application/json"}
  
    # We include this header to make sure that these params are passed as JSON rather than as plain text
    put "/api/v1/items/#{id}", params: JSON.generate(item_params), headers: headers
    item = Item.find_by(id: id)
  
    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Big 5 Sports")
  end
end
  