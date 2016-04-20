require 'rails_helper'

feature 'user is able to sign in and out' do
  scenario 'user signs in as student' do
    freddie = FactoryGirl.create(:student)
    visit new_student_session_path

    fill_in "Email", with: freddie.email
    fill_in "Password", with: freddie.password
    click_button "Log in"

    expect(page).to_not have_content("error")
  end

  scenario 'user signs in as tourist' do
    hermione = FactoryGirl.create(:tourist)
    visit new_tourist_session_path

    fill_in "Email", with: hermione.email
    fill_in "Password", with: hermione.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
  end

  scenario 'user signs out' do
    hermione = FactoryGirl.create(:tourist)
    visit new_tourist_session_path

    fill_in "Email", with: hermione.email
    fill_in "Password", with: hermione.password
    click_button "Log in"

    click_link "Log Out"

    expect(page).to have_content("Signed out successfully")
  end
end
