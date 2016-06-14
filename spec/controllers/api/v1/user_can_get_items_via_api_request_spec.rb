require 'rails_helper'

RSpec.describe Api::V1::ItemsController do
  
  describe "#items" do

    it "returns a successful response" do
      get :index, format: :json

      assert_response :success
    end

    it "returns all items as json" do
      get :index, format: :json
      item = create_item(3)
      binding.pry
      expect(response.body.count).to eq(3)
      expect(response.body.last['id']).to eq(item.id)

      within("#item-id-#{item.id}") do
        expect(page).to have_content(item.name)
        expect(page).to have_content(item.description)
        expect(page).to have_content(item.image_url)
        expect(page).not_to have_content(item.created_at)
        expect(page).not_to have_content(item.updated_at)
      end
    end

  end

end


# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items 
# And each item has a name, description, and image_url 
# but not the created_at or updated_at