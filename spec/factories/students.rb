FactoryGirl.define do
  factory :student do
    first_name "Freddie"
    last_name "Mercury"
    sequence(:email) { |n| "fbulsara#{n}@queen.edu" }
    photo_url "https://pmcdeadline2.files.wordpress.com/2015/11/freddie-mercury.jpg"
    interests "I love to ride my bicycle"
    year_in_college "Super Senior"
    living_situation "Mansion"
    hometown "Stone Town, Tanzania"
    major "Music Performance"
    password "password"

    school
  end
end
