class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |t|
      t.integer :csv_id
      t.string :name
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
