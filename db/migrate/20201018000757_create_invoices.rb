class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :customer_id, foreign_key: true
      t.integer :merchant_id, foreign_key: true
      t.string :status
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
