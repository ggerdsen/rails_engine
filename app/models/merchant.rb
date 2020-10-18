class Merchant < ApplicationRecord
  validates_presence_of :csv_id,
                        :name,
                        :created_at,
                        :updated_at
  
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
end
