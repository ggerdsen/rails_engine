class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.integer :item_id, foreign_key: true
      t.integer :invoice_id, foreign_key: true
      t.integer :quantity
      t.integer :unit_price
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
