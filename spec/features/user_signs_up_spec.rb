require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account

  Acceptance Criteria:
  [x] I must specify a valid email address,
      password, and password confirmation
  [x] If I don't specify the required information, I am presented with
      an error message
} do

  scenario 'provide valid registration information' do
    visit new_user_registration_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'User Name', with: 'Tony'
    root_photo = "#{Rails.root}/spec/support/images/example_photo.png"
    attach_file "Profile Photo", root_photo
    click_button 'Sign up'
    user = User.last
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
    expect(page).to have_css("img[src*='example_photo.png']")
    expect(user.profile_photo.file.filename).to eq("example_photo.png")
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end
