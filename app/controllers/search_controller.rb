class SearchController < ApplicationController

def index
  HTTParty.get("http://api.bestbuy.com/v1/stores(area(55423,10))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=#{ENV['BEST_BUY_KEY']}")
end


end