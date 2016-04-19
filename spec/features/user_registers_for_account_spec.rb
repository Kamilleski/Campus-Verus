require 'rails_helper'

feature 'user can register for an account as either a student or a tourist' do
  scenario 'user can navigate to student registration from home page' do
    visit root_path

    click_link "Join as a college student!"

    expect(page).to have_content("Photo url")
    expect(page).to have_content("Interests")
    expect(page).to have_content("Hometown")
    expect(page).to_not have_content("Intended start date year")
  end

  scenario 'user can navigate to tourist registration from home page' do
    visit root_path

    click_link "Join as a tourist!"

    expect(page).to have_content("Intended start date year")
    expect(page).to have_content("Prospective major")
    expect(page).to_not have_content("Photo url")
    expect(page).to_not have_content("Interests")
    expect(page).to_not have_content("Hometown")
  end
end
