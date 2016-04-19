require 'rails_helper'
describe Tourist do
  it { should have_valid(:first_name).when("John", "Sally") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Smith", "O'Leary", "San Miguel") }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:prospective_major).when("Classics", "Environmental Science", "Undeclared") }
  it { should_not have_valid(:prospective_major).when(nil, "") }

  it { should have_valid(:intended_start_date_semester).when("Fall", "Spring", "Summer", "Winter") }
  it { should_not have_valid(:intended_start_date_semester).when(nil, "", "Dawn") }

  it { should have_valid(:intended_start_date_year).when(2016, 2018, 2020) }
  it { should_not have_valid(:intended_start_date_year).when(nil, "", "Dawn") }

  it { should have_valid(:email).when("user@example.edu") }
  it { should_not have_valid(:email).when("foo.com", "@") }
end
