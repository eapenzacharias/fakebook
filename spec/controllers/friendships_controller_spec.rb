# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  describe 'Friendship controller' do
    it 'index returns http success' do
      user = FactoryBot.create(:user)
      sign_in(user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end