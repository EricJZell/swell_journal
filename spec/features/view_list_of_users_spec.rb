require 'rails_helper'

feature 'user views list of all users', %{
  As a user
  I want to view a list of other users
  So that I can look for people I may know

  # Acceptance Criteria
  [] I must navigate to the list from the home page

} do

  scenario 'user navigates to users index' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    visit root_path
    click_button 'Search'
    expect(current_path).to eq("/users")
    expect(page).to have_content(user1.user_name)
    expect(page).to have_content(user2.user_name)
  end
end
