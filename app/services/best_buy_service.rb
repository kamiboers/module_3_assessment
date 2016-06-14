class BestBuyService

def call(zip, distance=25)
  HTTParty.get("http://api.bestbuy.com/v1/stores(area(#{zip},#{distance}))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_KEY']}")
  raw_stores = JSON.parse(response.body)
  binding.pry
end
And I should see the long name, city, distance, phone number and store type for each of the 15 results


end
