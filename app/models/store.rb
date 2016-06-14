class Store
attr_reader :name,
            :city,
            :distance,
            :phone,
            :type,
            :id

def initialize(name, city, distance, phone, type, id)
  @name = name
  @city = city
  @distance = distance
  @phone = phone
  @type = type
  @id = id
end

end