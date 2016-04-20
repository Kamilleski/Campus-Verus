require 'rails_helper'

feature 'user can edit their account as either a student or a tourist' do
  scenario 'student successfully edits profile' do
    freddie = FactoryGirl.create(:student)
    login_as(freddie, :scope => :student)

  end
  scenario 'tourist successfully edits profile' do
    hermione = FactoryGirl.create(:tourist)
    login_as(hermione, :scope => :tourist)

  end
end
