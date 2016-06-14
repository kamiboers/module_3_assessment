require 'rails_helper'

RSpec.describe Api::V1::ItemsController do
  
  describe "#index" do

    it "returns a successful response for index" do
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

      expect(result).not_to have_content("created_at")
      expect(result).not_to have_content("updated_at")
    end

  end

  describe "#show" do

    it "returns a successful response for show" do
      item = create_item
      get :show, id: item.id, format: :json

      assert_response :success
    end

    it "returns item as json" do
      item = create_item
      item2 = create_item
      get :show, id: item.id, format: :json
      result = JSON.parse(response.body)
      
      expect(result['id']).to eq(item.id)
      expect(result).to have_content(item.name)
      expect(result).to have_content(item.description)
      expect(result).to have_content(item.image_url)

      expect(response).not_to have_content("created_at")
      expect(response).not_to have_content("updated_at")  
      expect(response).not_to have_content(item2.name)
      expect(response).not_to have_content(item2.description)
    end

  end

  describe "#delete" do

    it "returns a 204 response for successful delete" do
      item = create_item
      delete :destroy, id: item.id, format: :json

      assert_response 204
    end

  end

  describe "#create" do
    it "returns a successful response for create" do
      item = create_item
      post '/api/v1/items', name: "Smelloscope", description: "Smells", image_url: "smelloscope.jpg", format: :json
      result = JSON.parse(response.body)

      assert_response 201
      expect(result['name']).to eq("Smelloscope")
      expect(result['description']).to eq("Smells")
      expect(result['image_url']).to eq("smelloscope.jpg")
    end
  end


end

# When I send a POST request to /api/v1/items 
# with a name, description, and image_url 
# I receive a 201 JSON response if the record is successfully created 
# And I receive a JSON response containing the name, description, and image_url 
# but not the created_at or updated_at


# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items 
# And each item has a name, description, and image_url 
# but not the created_at or updated_at

# When I send a GET request to /api/v1/items/1 
# I receive a 200 JSON response containing the name, description, and image_url 
# but not the created_at or updated_at

# When I send a DELETE request to /api/v1/items/1 
# I receive a 204 JSON response if the record is successfully deleted

