class SearchController < ApplicationController

def index
  response = BestBuyService.search(params[:zip])
  @stores = response.first
  @total_count = response.last
end

def show
  response = BestBuyService


end