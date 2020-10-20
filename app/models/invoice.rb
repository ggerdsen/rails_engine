class Invoice < ApplicationRecord
  validates_presence_of :customer_id,
                        :merchant_id,
                        :status,
                        :created_at,
                        :updated_at
  
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
end
