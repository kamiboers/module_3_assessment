class SearchController < ApplicationController

def index
  response = BestBuyService.call(params[:zip])
  @stores = response.first
  @total_count = response.last
end


end