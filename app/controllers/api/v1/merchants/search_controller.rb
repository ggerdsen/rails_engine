class Api::V1::Merchants::SearchController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.where('name ILIKE ?', "%#{item_params[:name]}%"))
  end

  def show
    render json: MerchantSerializer.new(Merchant.find_by('name ILIKE ?', "%#{item_params[:name]}%"))
  end
  
  private
  
  def item_params
    params.permit(:name)
  end
end