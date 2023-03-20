# frozen_string_literal: true

describe 'Registration Form', type: :feature do
  let(:user) { build(:user) }

  before { visit root_path }

  context 'when user have valid values' do
    it 'redirects to thank you page' do
      fill_in 'user_email', with: user.email
      fill_in 'user_name', with: user.name
      click_button 'Join the waiting list'

      expect(page).to have_content('Thank you')
    end
  end

  context 'when user have invalid values', js: true do

    it 'does not allow submit form' do
      click_button 'Join the waiting list'

      expect(page).to have_content('Please provide an email before submitting the form')
    end

    it 'shows errors' do
      fill_in 'user_email', with: 'invalid email'
      fill_in 'user_name', with: 'Jo'
      click_button 'Join the waiting list'

      expect(page).to have_content('Email must have an @ character')
      expect(page).to have_content('Please provide your name')
    end
  end
end
