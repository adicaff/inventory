require 'rails_helper'

feature 'Visitor ask for new password' do
  let(:email) { Faker::Internet.email }
  scenario 'with valid email' do
    FactoryGirl.create(:user, email: email)
    send_password_instructions(email)

    expect(page).to have_content('You will receive an email with instructions')
  end

  scenario 'with invalid email' do
    send_password_instructions 'invalid_email'

    expect(page).to have_content('Email not found')
  end

  scenario 'with blank email' do
    send_password_instructions ''

    expect(page).to have_content('Email can\'t be blank')
  end

  def send_password_instructions(email)
    visit new_user_password_path
    fill_in 'user_email', with: email
    click_button 'Send'
  end

end