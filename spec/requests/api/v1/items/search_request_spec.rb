require 'rails_helper'

describe "Search endpoints" do
  it 'can find a list of items that contain a fragment, case insensitive' do
    item = create_list(:item, 3)
    item_1 = create(:item, name: "Sharus")

    get '/api/v1/items/find_all?name=haru'
    
    json = JSON.parse(response.body, symbolize_names: true)

    names = json[:data].map do |merchant|
      merchant[:attributes][:name].downcase
    end
    expect(names.count).to eq(1)
    names.each do |name|
      expect(name).to include('haru')
    end
  end
  
  it 'can find an items that contain a fragment, case insensitive' do
  item = create_list(:item, 3)
  item_1 = create(:item, name: "Sharus")
  
  get '/api/v1/items/find?name=haru'
  
  json = JSON.parse(response.body, symbolize_names: true)

  name = json[:data][:attributes][:name].downcase
  expect(json[:data]).to be_a(Hash)
  expect(name).to include('haru')
end
end