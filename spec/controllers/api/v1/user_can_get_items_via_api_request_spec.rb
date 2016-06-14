require 'rails_helper'

RSpec.describe Api::V1::ItemsController do
  
  describe "#items" do

    it "returns a successful response" do
      get :index, format: :json

      assert_response :success
    end

    it "returns all items as json" do
      item = create_item(3)
      get :index, format: :json
      result = JSON.parse(response.body)
      
      expect(result.count).to eq(3)
      expect(result.last['id']).to eq(item.id)
      expect(result).to have_content(item.name)
      expect(result).to have_content(item.description)
      expect(result).to have_content(item.image_url)
      expect(response).not_to have_content("created_at")
      expect(response).not_to have_content("updated_at")
    end

  end



end


# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items 
# And each item has a name, description, and image_url 
# but not the created_at or updated_at

# When I send a GET request to /api/v1/items/1 
# I receive a 200 JSON response containing the name, description, and image_url 
# but not the created_at or updated_at