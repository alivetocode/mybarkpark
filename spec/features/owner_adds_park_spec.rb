require 'spec_helper'

feature 'owner adds a park', %Q{
  As an owner
  I want to add a park
  So I can check my dog into a dog park that doesn't yet exist on the site
} do
  # After signing in I have option to add a park
  # I can only add a park after being authenticated and enter the site
  # An owner can add more than one park
  # I required to provide a name, address, city, state and zip code
  # I may optionally provide a description
  # If I use a name that already exists, I get an error
  # If I use an address that already exists I get an error

  let(:owner) { FactoryGirl.create( :owner ) }

  before :each do
    sign_in_as(owner)
  end

  context "Owner supplies valid park information" do

    it "should create a new park" do
      visit root_path
      click_on "Check-in to a park"
      click_on "Add a park"

      fill_in "Name", with: "Wilmingtom Dog Park"
      fill_in "Address", with: "123 Main Street"
      fill_in "City", with: "Wilmington"
      fill_in "State", with: "NC"
      fill_in "Zip code", with: "27527"
      fill_in "Description", with: "5 acres with seperate areas for large/medium/small dogs"
      click_on "Add Park"

      expect(page).to have_content("BowWow! You created a park!")
      visit parks_path
      expect(page).to have_content("Wilmingtom Dog Park")
    end

  end

  context "User supplies invalid information" do

    it "should give an error if required fields are left blank" do
      visit new_park_path
      click_on "Add Park"

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content("Zip code can't be blank")
    end

    it "should give an error if name name already exists" do
      park = FactoryGirl.create(:park)

      visit new_park_path
      fill_in "Name", with: park.name
      fill_in "Address", with: "123 Main Street"
      fill_in "City", with: "Wilmington"
      fill_in "State", with: "NC"
      fill_in "Zip code", with: "27527"
      fill_in "Description", with: "5 acres with seperate areas for large/medium/small dogs"
      click_on "Add Park"

      expect(page).to have_content("Name has already been taken")
    end

    it "should give an error if address already exists" do
      park = FactoryGirl.create(:park)

      visit new_park_path
      fill_in "Name", with: "Wilmington Dog Park"
      fill_in "Address", with: park.address
      fill_in "City", with: "Wilmington"
      fill_in "State", with: "NC"
      fill_in "Zip code", with: "27527"
      fill_in "Description", with: "5 acres with seperate areas for large/medium/small dogs"
      click_on "Add Park"

      expect(page).to have_content("Address has already been taken")
    end

    it "should give an error if zip code is invalid format" do
      visit new_park_path
      click_on "Add Park"

      fill_in "Name", with: "Wilmingtom Dog Park"
      fill_in "Address", with: "123 Main Street"
      fill_in "City", with: "Wilmington"
      fill_in "State", with: "NC"
      fill_in "Zip code", with: "275274"
      fill_in "Description", with: "5 acres with seperate areas for large/medium/small dogs"
      click_on "Add Park"

      expect(page).to have_content("invalid: format should be 12345 or 12345-1234")
      expect(page).to have_content("Add a Park")
    end

  end

end
