require 'rails_helper'

describe 'business intelligence' do
  before :each do
    @m1, @m2, @m3, @m4, @m5, @m6 = create_list(:merchant, 6)
    # one item per merchant
    @it1 = create(:item, merchant: @m1)
    @it2 = create(:item, merchant: @m2)
    @it3 = create(:item, merchant: @m3)
    @it4 = create(:item, merchant: @m4)
    @it5 = create(:item, merchant: @m5)
    @it6 = create(:item, merchant: @m6)
    # one invoice for each merchant, status=shipped, also set the created_at
    @iv1 = create(:invoice, merchant: @m1, status: 'shipped', created_at: '2020-01-01T00:00:00 UTC')
    @iv2 = create(:invoice, merchant: @m2, status: 'shipped', created_at: '2020-02-02T00:00:00 UTC')
    @iv3 = create(:invoice, merchant: @m3, status: 'shipped', created_at: '2020-03-03T00:00:00 UTC')
    @iv4 = create(:invoice, merchant: @m4, status: 'shipped', created_at: '2020-04-04T00:00:00 UTC')
    @iv5 = create(:invoice, merchant: @m5, status: 'shipped', created_at: '2020-05-05T00:00:00 UTC')
    @iv6 = create(:invoice, merchant: @m6, status: 'packaged', created_at: '2020-06-06T00:00:00 UTC')
    # one invoice_item for each invoice, low quantity and price to high quantity and price
    @ii1 = create(:invoice_item, invoice: @iv1, item: @it1, quantity: 10, unit_price: 1) # rev: $10
    @ii2 = create(:invoice_item, invoice: @iv2, item: @it2, quantity: 20, unit_price: 3) # rev: $60
    @ii3 = create(:invoice_item, invoice: @iv3, item: @it3, quantity: 30, unit_price: 5) # rev: $150
    @ii4 = create(:invoice_item, invoice: @iv4, item: @it4, quantity: 40, unit_price: 7) # rev: $280
    @ii5 = create(:invoice_item, invoice: @iv5, item: @it5, quantity: 50, unit_price: 9) # rev: $450
    @ii6 = create(:invoice_item, invoice: @iv6, item: @it6, quantity: 60, unit_price: 11) # rev: $660
    # one transaction for each invoice which are result=success
    @t1 = create(:transaction, invoice: @iv1, result: 'success')
    @t2 = create(:transaction, invoice: @iv2, result: 'success')
    @t3 = create(:transaction, invoice: @iv3, result: 'success')
    @t4 = create(:transaction, invoice: @iv4, result: 'success')
    @t5 = create(:transaction, invoice: @iv5, result: 'success')
    @t6 = create(:transaction, invoice: @iv6, result: 'success')
  end
  
  xit 'can get merchants with most revenue' do
    
    get "/api/v1/merchants/most_revenue?quantity=7"
    
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(7)

    expect(json[:data][0][:attributes][:name]).to eq("Dicki-Bednar")
    expect(json[:data][0][:id]).to eq("14")

    expect(json[:data][3][:attributes][:name]).to eq("Bechtelar, Jones and Stokes")
    expect(json[:data][3][:id]).to eq("10")

    expect(json[:data][6][:attributes][:name]).to eq("Rath, Gleason and Spencer")
    expect(json[:data][6][:id]).to eq("53")
  end

  xit 'can get merchants who have sold the most items' do
    response = conn("/api/v1/merchants/most_items?quantity=8").get

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(8)

    expect(json[:data][0][:attributes][:name]).to eq("Kassulke, O'Hara and Quitzon")
    expect(json[:data][0][:id]).to eq("89")

    expect(json[:data][3][:attributes][:name]).to eq("Okuneva, Prohaska and Rolfson")
    expect(json[:data][3][:id]).to eq("98")

    expect(json[:data][7][:attributes][:name]).to eq("Terry-Moore")
    expect(json[:data][7][:id]).to eq("84")
  end
end