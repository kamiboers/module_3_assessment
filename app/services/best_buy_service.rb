class BestBuyService
attr_reader :stores

def self.call(zip, distance=25)
  response = HTTParty.get("http://api.bestbuy.com/v1/stores(area(#{zip},#{distance}))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_KEY']}")
  create_store_objects(response)
end

def self.create_store_objects(response)
  raw_stores = JSON.parse(response.body)['stores']
  @stores = raw_stores.map do |rs|
    Store.new(rs['longName'], rs['city'], rs['distance'], rs['phone'], rs['storeType'])
  end
end


end
