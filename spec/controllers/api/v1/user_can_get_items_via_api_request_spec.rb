require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do
  
  describe "GET api/v1/items" do
    it "returns a successful response" do
      get 'api/v1/items', format: :json

      expect(page.status_code).to eq(200)
      assert_response :success
    end

    it "returns all items as json" do
       get :index, format: :json

      expect(response.body.count).to eq(100)
      expect(response.body.last['id']).to eq(33)

      item = Item.find(12)

      within('#item-id-12') do
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