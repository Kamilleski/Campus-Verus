require 'rails_helper'

feature 'user can edit their account as either a student or a tourist' do
  scenario 'student successfully edits profile' do
    freddie = FactoryGirl.create(:student)
    visit new_student_session_path

    fill_in "Email", with: freddie.email
    fill_in "Password", with: freddie.password
    click_button "Log in"

    click_link "Your Account"

    fill_in "student_photo_url", with: "http://pixel.nymag.com/imgs/daily/vulture/2015/12/03/03-freddie-mercury.w529.h529.jpg"
    fill_in "student_current_password", with: freddie.password

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario 'student unsuccessfully edits profile' do
    freddie = FactoryGirl.create(:student)
    visit new_student_session_path

    fill_in "Email", with: freddie.email
    fill_in "Password", with: freddie.password
    click_button "Log in"

    click_link "Your Account"

    fill_in "student_photo_url", with: "http://pixel.nymag.com/imgs/daily/vulture/2015/12/03/03-freddie-mercury.w529.h529.jpg"

    click_button "Update"

    expect(page).to have_content "Current password can't be blank"
    expect(freddie.photo_url).to eq("https://pmcdeadline2.files.wordpress.com/2015/11/freddie-mercury.jpg")
  end

  scenario 'tourist successfully edits profile' do
    hermione = FactoryGirl.create(:tourist)
    visit new_tourist_session_path

    fill_in "Email", with: hermione.email
    fill_in "Password", with: hermione.password
    click_button "Log in"

    click_link "Your Account"

    fill_in "tourist_prospective_major", with: "Classics"
    fill_in "tourist_current_password", with: hermione.password

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario 'tourist unsuccessfully edits profile' do
    hermione = FactoryGirl.create(:tourist)
    visit new_tourist_session_path

    fill_in "Email", with: hermione.email
    fill_in "Password", with: hermione.password
    click_button "Log in"

    click_link "Your Account"

    fill_in "tourist_prospective_major", with: "Classics"

    click_button "Update"

    expect(page).to have_content "Current password can't be blank"
    expect(hermione.prospective_major).to eq("Chemical Engineering")
  end
end
