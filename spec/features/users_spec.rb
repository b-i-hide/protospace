require 'rails_helper'

feature 'User management' do
  subject(:user){ create(:user) }

  def sign_up
    visit root_path
    click_link 'Get Started'
    click_link 'Sign up now'
    fill_in 'Name', with: 'hoge'
    fill_in 'Password', with: '00000000'
    fill_in 'E-Mail', with: 'hoge@gmail.com'
    click_on 'Sign up'
  end

  def sign_in
    visit root_path
    click_link 'Get Started'
    fill_in 'Email address', with: subject.email
    fill_in 'Password', with: subject.password
    click_button 'Sign in'
  end

  def post_prototype
    sign_up
    click_on 'New Proto'
    fill_in 'Title', with: 'hoge'
    attach_file 'prototype[images_attributes][0][image]', "#{Rails.root}/spec/fixtures/img/sample.jpg", visible: false
    fill_in 'Catch Copy', with: 'hoge'
    fill_in 'Concept', with: 'hoge'
    click_button 'Publish'
  end

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

