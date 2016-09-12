module FeatureMacros
  def sign_up
    visit root_path
    click_link 'Get Started'
    click_link 'Sign up now'
    fill_in 'Name', with: new_user.name
    fill_in 'Password', with: new_user.password
    fill_in 'E-Mail', with: new_user.email
    click_on 'Sign up'
  end
end
