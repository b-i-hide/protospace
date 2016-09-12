require 'rails_helper'

feature 'User management' do
  subject(:user){ create(:user) }

  scenario 'sign up' do
    sign_up
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'sign in' do
    sign_in
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'post prototype', js: true do
    post_prototype
    expect(page).to have_content 'Your prototype was successfully posted'
  end
end

