class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    respond_with 204 if Item.find(params[:id]).delete 
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: 201
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end


end