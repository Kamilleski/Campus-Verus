require "rails_helper"

feature "user can see a list of colleges with links to their show pages" do
  scenario "user is not signed in" do
    visit root_path

    expect(page).to have_content("Schools available for tours:")
    expect(page).to have_content("Select school to view details and available guides.")
    expect(page).to have_content("University of California, Berkeley")
  end

  scenario "user is not signed in an cannot view show page" do
    visit root_path

    click_link "California State University, Chico"

    # expect(page).to have_content("You must have an account to access these features.")
    # expect(page).to have_content("Please log in or sign up!")
    expect(page).to_not have_content("Harvard University")
  end
end
