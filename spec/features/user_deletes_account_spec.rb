require 'rails_helper'

feature 'user can delete their account as either a student or a tourist' do
  scenario 'student deletes account' do
    freddie = FactoryGirl.create(:student)
    visit new_student_session_path

    fill_in "Email", with: freddie.email
    fill_in "Password", with: freddie.password
    click_button "Log in"

    click_link "Your Account"

    click_button "Cancel my student account"

    expect(page).to have_content("Your account has been successfully cancelled")
  end

  scenario 'tourist deletes account' do
    hermione = FactoryGirl.create(:tourist)
    visit new_tourist_session_path

    fill_in "Email", with: hermione.email
    fill_in "Password", with: hermione.password
    click_button "Log in"

    click_link "Your Account"

    click_button "Cancel my tourist account"

    expect(page).to have_content("Your account has been successfully cancelled")
  end
end
