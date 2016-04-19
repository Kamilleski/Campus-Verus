FactoryGirl.define do
  factory :tourist do
    first_name "Emma"
    last_name "Watson"
    sequence(:email) { |n| "hermione#{n}@hogwarts.edu" }
    prospective_major "Chemical Engineering"
    intended_start_date_semester "Fall"
    intended_start_date_year 2017
    password "password"
  end
end
