class Store
attr_reader :name,
            :city,
            :distance,
            :phone,
            :type,
            :id,
            :address,
            :state,
            :hours,
            :zip

def initialize(name, city, distance, phone, type, id, address=nil, state=nil, zip=nil, hours=nil)
  @name = name
  @city = city
  @distance = distance
  @phone = phone
  @type = type
  @id = id
  @address = address
  @state = state
  @hours = hours
  @zip = zip
end

end