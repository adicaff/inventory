require 'rails_helper'

feature 'Visitor ask for new password' do
  let(:email) { 'koko@koko.com' }
  scenario 'with valid email' do
    FactoryGirl.create(:user, email: email)
    ask_for_password(email)

    expect(page).to have_content('Log in')
  end

  scenario 'with invalid email' do
    ask_for_password 'invalid_email'

    expect(page).to have_content('Email not found')
  end

  scenario 'with blank email' do
    ask_for_password ''

    expect(page).to have_content('Email can\'t be blank')
  end

  def ask_for_password(email)
    visit new_user_password_path
    fill_in 'user_email', with: email
    click_button 'Send me reset password instructions'
  end

end