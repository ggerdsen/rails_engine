class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end
  
  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end
  
  def create
    binding.pry
    render json: MerchantSerializer.new(Merchant.create(merchant_params))
  end
  
  private
  
  def merchant_params
    params.permit(:name)
  end
end