require 'rails_helper'

RSpec.describe "search", :type => :feature do
  
  describe "search for stores" do
    it "returns a local store search" do
      visit '/'
      fill_in 'search' with '80202'
      click_on "search"

      expect(current_path).to eq('/search')
      expect(page).to have_content('25 miles')
      expect(page).to have_content('17 Total Stores')
      expect(@stores.count).to eq(15)
      expect(page).to have_content('long name')
      expect(page).to have_content('city')
      expect(page).to have_content('distance')
      expect(page).to have_content('phone number')
      expect(page).to have_content('store type')
    end
  end

end

# class SunlightServiceTest < ActiveSupport::TestCase
#   attr_reader :service

#   def setup
#     @service = SunlightService.new
#   end

# end

# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
