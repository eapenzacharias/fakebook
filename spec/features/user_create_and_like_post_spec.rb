# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'User Logged In' do
  scenario 'User creates a post and likes it' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit new_user_session_path
    click_on 'Post'
    within('form') do
      fill_in 'post[content]', with: 'Test'
    end
    click_button 'Post'
    expect(page).to have_content('Your post has been created')

    click_on 'Like'
    expect(page).to have_content('You liked the post')
  end
end