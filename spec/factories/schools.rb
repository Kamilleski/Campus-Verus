FactoryGirl.define do
  factory :school do
    name "University of California Berkeley"
    nickname "Berkeley"
    city "Berkeley"
    state "CA"
    motto "Fiat Lux"
    email_domain "berkeley.edu"
    undergrad_population 27126
    graduate_population 10455
    public true
    logo "http//www.berkeley.edu/brand/img/seals/ucbseal_139_540.png"
    mascot "Oski the Bear"
    date_founded 1868
  end
end
