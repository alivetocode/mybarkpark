require 'spec_helper'

feature 'owner checks dog in/out of park', %Q{
  As an owner
  I want check my dog into a park
  So I can see profiles of all dogs checked in
} do
  # Acceptance Criteria
  # I see a list of all parks available
  # I can optionally sort list of parks by name, city or zip code
  # I can check my dog into a park from the park listing
  # Before checking in, I choose from a list of dogs I own


  let(:owner) { FactoryGirl.create( :owner ) }
  let!(:park1) { FactoryGirl.create(:park, name: "Park1", address: "90 North Lane") }
  let!(:park2) { FactoryGirl.create(:park, name: "Park2", address: "4990 South Lane") }


  before :each do
    sign_in_as(owner) #defined in spec/support/authentication_helper.rb
  end

  context "An owner can see a list of dog parks" do

    it "should list parks" do
      visit root_path
      click_on "Check-in to a park"

      expect(page).to have_content("Park Listing")
      expect(page).to have_content(park1.name)
      expect(page).to have_content(park2.name)

    end

    # it "should sort list parks by name, city or zip code" do
    #   visit root_path
    #   click_on "Check-in to a park"

    #   expect(page).to have_content("Park Listing")
    #   expect(page).to have_content("Park1")
    #   expect(page).to have_content("Park2")
    # end

  end

  context "I can check my dog in and out of a particular dog park" do

    it "checks my dog into a park I select" do
      visit root_path
      click_on "Add a dog"
      fill_in "Name", with: "Tester"
      fill_in "Gender", with: "Female"
      click_button 'Add a dog'
      click_on 'Back to home'
      click_on "Check-in to a park"
      click_on park1.name
      expect(page).to have_content("Park1")
      click_on "Check in to this park"
      select "Tester"#, from: "Select your Dog"
      click_on "Check In"
      expect(page).to have_content("You are checked in...have fun!")
    end

    it "checks out my dog from a park" do
        visit root_path
        click_on "Add a dog"
        fill_in "Name", with: "Tester"
        fill_in "Gender", with: "Female"
        click_button 'Add a dog'
        click_on 'Back to home'
        click_on "Check-in to a park"
        click_on park1.name
        expect(page).to have_content("Park1")
        click_on "Check in to this park"
        select "Tester"#, from: "Select your Dog"
        click_on "Check In"
        click_on "Check Out"

        expect(page).to have_content("You are checked out")

    end
  end
end
