class SearchController < ApplicationController

def index
  @stores = BestBuyService.call(params[:zip]).stores
end


end