require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background { visit new_user_registration_path }

  scenario 'with valid information' do
    fill_in 'user[name]', with: 'tufahel'
    fill_in 'Email', with: 'tufahel@gmail.com'
    fill_in 'Password', with: 'tufahel12345'

    click_button 'Next'
  end

  scenario 'with invalid information' do
    fill_in 'user[name]', with: ''
    fill_in 'Email', with: 'tufahel@gmail.com'
    fill_in 'Password', with: 'tufahel12345'

    click_button 'Next'
    expect(page).to have_content('error prohibited this user from being saved')
  end
end