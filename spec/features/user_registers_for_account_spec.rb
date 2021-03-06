require 'rails_helper'

feature 'user can register for an account as either a student or a tourist' do
  scenario 'user can navigate to student registration from home page' do
    visit root_path

    click_link "Join as a college student!"

    expect(page).to have_content("Link to photo")
    expect(page).to have_content("Interests")
    expect(page).to have_content("Hometown")
    expect(page).to_not have_content("Year of intended start date")
  end

  scenario 'user can navigate to tourist registration from home page' do
    visit root_path

    click_link "Join as a tourist!"

    expect(page).to have_content("Year of intended start date")
    expect(page).to have_content("Prospective major")
    expect(page).to_not have_content("Link to photo")
    expect(page).to_not have_content("Interests")
    expect(page).to_not have_content("Hometown")
  end

  scenario 'user can navigate to student registration from top bar' do
    visit schools_path

    click_link "Become a Guide"

    expect(page).to have_content("Link to photo")
    expect(page).to have_content("Interests")
    expect(page).to have_content("Hometown")
    expect(page).to_not have_content("Year of intended start date")
  end

  scenario 'user can navigate to tourist registration from top bar' do
    visit schools_path

    click_link "Take a Tour"

    expect(page).to have_content("Year of intended start date")
    expect(page).to have_content("Prospective major")
    expect(page).to_not have_content("Link to photo")
    expect(page).to_not have_content("Interests")
    expect(page).to_not have_content("Hometown")
  end

  scenario 'user can register as college student guide' do
    freddie = FactoryGirl.build(:student)

    visit new_student_registration_path

    fill_in "student_first_name", with: freddie.first_name
    fill_in "student_last_name", with: freddie.last_name
    fill_in "student_email", with: freddie.email
    select freddie.school.name, from: "student_school_id"
    fill_in "student_photo_url", with: freddie.photo_url
    fill_in "student_interests", with: freddie.interests
    select freddie.year_in_college, from: "student_year_in_college"
    fill_in "student_living_situation", with: freddie.living_situation
    fill_in "student_hometown", with: freddie.hometown
    fill_in "student_major", with: freddie.major
    fill_in "student_password", with: freddie.password
    fill_in "student_password_confirmation", with: freddie.password

    click_button "Sign up"

    expect(page).to have_content("You are already signed in")
    expect(page).to_not have_content("error")
  end

  scenario 'user can register as tourist' do
    hermione = FactoryGirl.build(:tourist)

    visit new_tourist_registration_path

    fill_in "tourist_first_name", with: hermione.first_name
    fill_in "tourist_last_name", with: hermione.last_name
    fill_in "tourist_email", with: hermione.email
    fill_in "tourist_prospective_major", with: hermione.prospective_major
    select hermione.intended_start_date_semester, from: "tourist_intended_start_date_semester"
    fill_in "tourist_intended_start_date_year", with: hermione.intended_start_date_year
    fill_in "tourist_password", with: hermione.password
    fill_in "tourist_password_confirmation", with: hermione.password

    click_button "Sign up"

    expect(page).to have_content("Welcome!")
    expect(page).to_not have_content("error")
  end

  scenario 'student does not fill in registration form correctly' do
    freddie = FactoryGirl.build(:student)

    visit new_student_registration_path

    fill_in "student_first_name", with: freddie.first_name
    fill_in "student_last_name", with: freddie.last_name
    fill_in "student_email", with: freddie.email
    select freddie.school.name, from: "student_school_id"
    fill_in "student_interests", with: freddie.interests
    select freddie.year_in_college, from: "student_year_in_college"
    fill_in "student_living_situation", with: freddie.living_situation
    fill_in "student_password", with: freddie.password
    fill_in "student_password_confirmation", with: freddie.password

    click_button "Sign up"

    expect(page).to have_content("prohibited this student from being saved:")
    expect(page).to_not have_content("prohibited this tourist from being saved:")
    expect(page).to_not have_content("You are already signed in")
  end

  scenario 'tourist does not fill in registration form correctly' do
    hermione = FactoryGirl.build(:tourist)

    visit new_tourist_registration_path

    fill_in "tourist_first_name", with: hermione.first_name
    fill_in "tourist_email", with: hermione.email
    select hermione.intended_start_date_semester, from: "tourist_intended_start_date_semester"
    fill_in "tourist_intended_start_date_year", with: hermione.intended_start_date_year
    fill_in "tourist_password", with: hermione.password
    fill_in "tourist_password_confirmation", with: hermione.password

    click_button "Sign up"

    expect(page).to have_content("prohibited this tourist from being saved:")
    expect(page).to_not have_content("prohibited this student from being saved:")
    expect(page).to_not have_content("You are already signed in")
  end
end
