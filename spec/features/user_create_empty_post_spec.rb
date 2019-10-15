# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'User Logged In' do
  scenario 'an empty post could not be created' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Login'
    click_on 'Post'
    within('form') do
      fill_in 'post[content]', with: ''
    end
    click_button 'Post'
    expect(page).to have_content("Content can't be blank")
  end
end