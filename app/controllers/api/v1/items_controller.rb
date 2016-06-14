class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    binding.pry
    respond_with Item.all
  end

end