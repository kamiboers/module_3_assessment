class StoresController < ApplicationController

def search
  curl "https://api.bestbuy.com/v1/stores(area(55423,10))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=YourAPIKey"
end


end