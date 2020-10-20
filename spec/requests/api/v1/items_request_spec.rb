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
end
  