require 'rails_helper'

feature 'User management' do
  let(:registered_user){ create(:user) }
  let(:new_user){ build(:user) }
  let(:prototype){ build(:prototype) }

  scenario 'sign up' do
    visit root_path
    click_link 'Get Started'
    click_link 'Sign up now'
    fill_in 'Name', with: new_user.name
    fill_in 'Password', with: new_user.password
    fill_in 'E-Mail', with: new_user.email
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'sign in' do
    visit root_path
    click_link 'Get Started'
    fill_in 'Email address', with: registered_user.email
    fill_in 'Password', with: registered_user.password
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'post prototype', js: true do
    sign_up
    click_on 'New Proto'
    fill_in 'Title', with: prototype.name
    attach_file 'prototype[images_attributes][0][image]', "#{Rails.root}/spec/fixtures/img/sample.jpg", visible: false
    fill_in 'Catch Copy', with: prototype.catch_copy
    fill_in 'Concept', with: prototype.concept
    click_button 'Publish'
    expect(page).to have_content 'Your prototype was successfully posted'
  end
end

