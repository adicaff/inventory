require 'rails_helper'

feature 'Visitor signs up' do
  let(:password) { Faker::Internet.password(8) }
  scenario 'with valid email, password and confirmation' do
    sign_up_with Faker::Internet.email, password, password

    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password', 'password'

    expect(page).to have_content('Email is invalid')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', '', ''

    expect(page).to have_content('Password can\'t be blank')
  end

  def sign_up_with(email, password, confirmation)
    visit new_user_registration_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: confirmation
    click_button 'Sign up'
  end

end