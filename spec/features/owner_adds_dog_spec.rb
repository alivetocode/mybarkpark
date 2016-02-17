require 'spec_helper'

feature 'owner adds a dog', %Q{

As an owner
I want to add a dog
So I can check my dog into a dog park
} do

# Acceptance Criteria:
# After signing in I have option to add dog
# An owner can add more than one dog
# I required to provide a name for my dog
# I may optionally provide a breed, color, gender, photo and personality attributes
# I can only add a dog after being authenticated and enter the site
# Only owners can create a dog, unregistered users will be asked to sign up


scenario 'owner creates a dog' do

  owner = FactoryGirl.create(:owner)
    visit root_path
    click_on "Login"
    fill_in "Email", with: owner.email
    fill_in "Password", with: owner.password
    click_button "Sign in"

  click_on 'Add a dog'
  fill_in 'Name', with: 'Melon'
  fill_in 'Breed', with: 'Mixed'
  fill_in 'Color', with: 'Tan'
  fill_in 'Gender', with: 'Male'  #select_tag [male female]
  fill_in 'Personality attributes', with: 'Very friendly...likes to lick'
  click_button 'Add a dog'

  expect(page).to have_content('Melon')
  expect(page).to have_content('Mixed')
  expect(page).to have_content('Tan')
  expect(page).to have_content('Male')
  expect(page).to have_content('Very friendly...likes to lick')
  expect(page).to have_content('Your dog was successfully created')
end


  scenario 'if name is not supplied I am presented an error'
  scenario 'an owner can only create a dog after signing in'
  scenario 'an unregistered visit cannot create a dog'
end
