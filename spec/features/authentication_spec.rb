require 'rails_helper'


feature 'authentication' do

  scenario 'user can sign up' do
    visit root_path
    click_on 'Sign Up'
    expect(page).to have_content("Sign Up Form")
    fill_in :user_email, with: "jeffrey@mince.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    within("form") {click_on 'Sign Up'}
    expect(current_path).to eq root_path
  end

  scenario 'user can login' do
    user = User.create!(email: "ian@brennan.com", password: "test", password_confirmation: "test")
    visit root_path
    click_on 'Sign In'
    expect(current_path).to eq sign_in_path
    expect(page).to have_content "Sign In"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    within("form") {click_on "Sign In"}
    expect(current_path).to eq root_path
    expect(page).to have_content("Welcome #{user.email}")
  end

end
