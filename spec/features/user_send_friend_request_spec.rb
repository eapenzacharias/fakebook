# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Logs in and' do
  before(:each) do
    @user = FactoryBot.create(:user)
    @other = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end
  describe 'send a friend request' do
    it 'checks success message' do
      visit '/users/user'
      first(:link_to, 'Send Friend Request').click
      expect(page).to have_content('You send a friend request to')
    end
    it 'checks friend request appears in Friends' do
      visit users_index_path
      first(:link_to, 'Send Friend Request').click
      expect(page).to have_content("#{@other.name} #{@other.email}")
    end
  end
end