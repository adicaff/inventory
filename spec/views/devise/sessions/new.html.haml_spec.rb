require 'rails_helper'

feature 'Visitor signs in' do
  let(:email) { 'koko@koko.com' }
  let(:password) { 'kokokoko' }
  scenario 'with valid email and password' do
    FactoryGirl.create(:user, email: email, password: password)
    sign_up_with email, password

    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Invalid email or password')
  end

  def sign_up_with(email, password)
    visit new_user_session_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Log in'
  end

end