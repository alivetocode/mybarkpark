require 'spec_helper'

feature 'owner returns to site and logs in', %Q{
  a registered user
  I want to login to my account
  So I can have access to the features of the site
} do

  scenario "user logs in" do
    owner = FactoryGirl.create(:owner)
    visit root_path
    click_on "Login"
    fill_in "Email", with: owner.email
    fill_in "Password", with: owner.password
    click_button "Sign in"

    expect(page).to have_content("Signed in successfully")

  end

end

