class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :csv_id
      t.integer :invoice_id, foreign_key: true
      t.bigint :credit_card_number
      t.date :credit_card_expiration_date
      t.string :result
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
