# class Api::V1::Merchants::RevenueController < ApplicationController
#   def index
#     # render json: MerchantSerializer.new(Merchant.where('name ILIKE ?', "%#{item_params[:name]}%"))
#   end
#
#   def show
#     quantity = params[:quantity]
#     # binding.pry
#     Merchant.joins(:transactions).joins(:invoices).joins(:invoice_items).select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").where("transactions.result='success'").group('merchants.id').order('revenue DESC').limit(quantity)
#     Merchant.joins(invoices: [:transactions, :invoice_items]).where("transactions.result='success'").group('merchants.id').order('revenue DESC').limit(quantity)
#     Merchant.joins(:transactions).select("merchants.id, merchants.name, sum(invoice_items.unit_price * invoice_items.quantity) as revenue").where("invoices.status='shipped' AND transactions.result='success'").group("merchants.id").order("revenue DESC").limit(7)
#     # render json: MerchantSerializer.new(Merchant.find_by('name ILIKE ?', "%#{item_params[:name]}%"))
#   end
#
# end

