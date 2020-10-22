class Api::V1::Items::SearchController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.where('name ILIKE ?', "%#{item_params[:name]}%"))
  end

  def show
    render json: ItemSerializer.new(Item.find_by('name ILIKE ?', "%#{item_params[:name]}%"))
  end
  
  private
  
  def item_params
    params.permit(:name)
  end
end