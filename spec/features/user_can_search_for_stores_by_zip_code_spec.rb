require 'rails_helper'

RSpec.describe "search", :type => :feature do
  
  describe "search for stores" do
    it "returns a local store search" do
      visit '/'
      fill_in 'zip', with: '80202'
      click_on "Locate"

      expect(current_path).to eq('/search')
      expect(page).to have_content('25 miles')
      expect(page).to have_content('17 Total Stores')
      
      expect(page).to have_selector('.store', count: 15)
      expect(page).to have_selector('#303-693-0166', count: 1)

      expect(page).to have_content('Store Name: Best Buy - Southglenn')
      expect(page).to have_content('City: Centennial')
      expect(page).to have_content('Distance: 11.0 miles')
      expect(page).to have_content('Phone #: 303-797-3246')
      expect(page).to have_content('Type: BigBox')
    end
  end

  describe "search results link to hours" do
    it "allows user to click store name and see hours" do
      visit '/'
      fill_in 'zip', with: '80202'
      click_on "Locate"
      click_on "Best Buy - Southglenn"

      # expect(current_path).to eq('stores/:storeid')

      expect(page).to have_content('Store Name: Best Buy - Southglenn')
      expect(page).to have_content('Type: BigBox')
      expect(page).to have_content('Address: ')
      expect(page).to have_content('City: Centennial')
      expect(page).to have_content('Zip: 80122')
      # expect(page).to have_content('Distance: 11.0 miles')
      # expect(page).to have_content('Phone #: 303-797-3246')
      within('ul') do
        expect(page).to have_content('Mon: 10am-9pm')
      end
    end
  end


end

# The name will be a link in the next story:

# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm



# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
