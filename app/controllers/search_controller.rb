class SearchController < ApplicationController

def index
  response = BestBuyService.search(params[:zip])
  @stores = response.first
  @total_count = response.last
end

def show
  @store = BestBuyService.store_info(params[:store_id])
end

end