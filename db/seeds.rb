require 'csv'

Customer.destroy_all
customers_csv = "./lib/customers.csv"
CSV.foreach(customers_csv, headers: :true, header_converters: :symbol) do |row|
   c = Customer.new
   c.csv_id = row[:id]
   c.first_name = row[:first_name]
   c.last_name = row[:last_name]
   c.created_at = row[:created_at]
   c.updated_at = row[:updated_at]
   c.save!
end

Merchant.destroy_all
merchants_csv = "./lib/merchants.csv"
CSV.foreach(merchants_csv, headers: :true, header_converters: :symbol) do |row|
  m = Merchant.new
  m.csv_id = row[:id]
  m.name = row[:name]
  m.created_at = row[:created_at]
  m.updated_at = row[:updated_at]
  m.save!
end

Invoice.destroy_all
invoices_csv = "./lib/invoices.csv"
CSV.foreach(invoices_csv, headers: :true, header_converters: :symbol) do |row|
  i = Invoice.new
  i.csv_id = row[:id]
  i.customer_id = row[:customer_id]
  i.merchant_id = row[:merchant_id]
  i.status = row[:status]
  i.created_at = row[:created_at]
  i.updated_at = row[:updated_at]
  i.save!
end

Item.destroy_all
items_csv = "./lib/items.csv"
CSV.foreach(items_csv, headers: :true, header_converters: :symbol) do |row|
  i = Item.new
  i.csv_id = row[:id]
  i.name = row[:name]
  i.description = row[:description]
  i.unit_price = row[:unit_price]
  i.merchant_id = row[:merchant_id]
  i.created_at = row[:created_at]
  i.updated_at = row[:updated_at]
  i.save!
end

InvoiceItem.destroy_all
invoice_items_csv = "./lib/invoice_items.csv"
CSV.foreach(invoice_items_csv, headers: :true, header_converters: :symbol) do |row|
  ii = InvoiceItem.new
  ii.csv_id = row[:id]
  ii.item_id = row[:item_id]
  ii.invoice_id = row[:invoice_id]
  ii.quantity = row[:quantity]
  ii.unit_price = row[:unit_price]
  ii.created_at = row[:created_at]
  ii.updated_at = row[:updated_at]
  ii.save!
end

Transaction.destroy_all
transactions_csv = "./lib/transactions.csv"
CSV.foreach(transactions_csv, headers: :true, header_converters: :symbol) do |row|
  t = Transaction.new
  t.csv_id = row[:id]
  t.invoice_id = row[:invoice_id]
  t.credit_card_number = row[:credit_card_number]
  t.result = row[:result]
  t.created_at = row[:created_at]
  t.updated_at = row[:updated_at]
  t.save!
end