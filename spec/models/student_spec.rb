require 'rails_helper'

describe Student do
  # it { should have_many :reviews }

  it { should have_valid(:first_name).when("John", "Sally") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Smith", "O'Leary", "San Miguel") }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:photo_url).when("http://bit.ly/1Njbryv") }
  it { should_not have_valid(:photo_url).when(nil, "") }

  it { should have_valid(:interests).when("Underwater basketweaving") }
  it { should_not have_valid(:interests).when(nil, "") }

  it { should have_valid(:year_in_college).when("Freshman", "Sophomore", "Junior", "Senior", "Super Senior", "Grad Student") }
  it { should_not have_valid(:year_in_college).when(nil, "", "Post-Bacc") }

  it { should have_valid(:living_situation).when("Co-Op Apartments", "Dorms") }
  it { should_not have_valid(:living_situation).when(nil, "") }

  it { should have_valid(:hometown).when("Chico, CA", "London, UK") }
  it { should_not have_valid(:hometown).when(nil, "") }

  it { should have_valid(:email).when("user@example.edu") }
  it { should_not have_valid(:email).when("foo.com", "@") }
end
