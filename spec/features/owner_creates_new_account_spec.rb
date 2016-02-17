require 'spec_helper'

feature 'owner creates a new account', %Q{

  As an owner
  I want to create and account
  So I can access the features of the website
} do

  # Acceptance Criteria
  # A new owner account must specify first name, last name, email, password
  # If I do not provide required information, I get an error message and account is not created
  # If I specify requires information, a new account is created and I am authenticated.
  # After my account is created and I am successfully authenticted, I am allowed to access the site...
  #  ...and begin using features

# * I may optionally specify city, state and photo of owner
# * If I supply a photo, it must be a jpg, png, or gif
# * If I supply a photo, it cannot exceed 5MB

    scenario 'specify valid and required information' do
      visit root_path  #is this the same as '/'
      click_on 'Sign Up'
      fill_in 'First Name', with: 'Bob'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'City', with: 'Mytown'
      fill_in 'State', with: 'NC'
      attach_file 'Photo', Rails.root.join('spec/file_fixtures/myphoto.jpg')
      fill_in 'Email', with: 'bob@example.com'
      fill_in 'Password', with: 'mypassword', exact: true
      fill_in 'Password Confirmation', with: 'mypassword', exact: true
      click_button 'Sign Up'


      expect(page).to have_content("You have signed up successfully")
      expect(page).to_not have_content("can't be blank")
      expect(page).to have_content("Logout")
      expect(Owner.last.photo_url.url).to be_present

    end

    scenario 'valid or required information is not supplied' do

      visit root_path
      click_on 'Sign Up'
      click_button 'Sign Up'

      expect(page).to_not have_content("You have signed up successfully")
      expect(page).to have_content("can't be blank")
      expect(page).to_not have_content("Logout")
     end

    scenario 'password confirmation does not match initial password' do
      visit root_path
    click_on 'Sign Up'
      fill_in 'First Name', with: 'Bob'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'bob@example.com'
      fill_in 'Password', with: 'mypassword', exact: true
      fill_in 'Password Confirmation', with: 'differentpassword', exact: true

      click_button 'Sign Up'
      expect(page).to_not have_content("You have signed up successfully")
      expect(page).to have_content("Password confirmation doesn't match")
    end

  end


