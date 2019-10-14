# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'User Logged In' do
  scenario 'User creates a post and coments ' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit new_post_path
    within('form') do
      fill_in 'content', with: 'Test'
    end
    submit 'Post'
    expect(page).to have_content('Your post has been created')
    within('form') do
      fill_in 'content', with: 'this is a comment'
    end
    click_button 'Comment!'
    expect(page).to have_content('You added a comment')
  end
end