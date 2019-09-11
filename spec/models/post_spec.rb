# frozen_string_literal: true

require 'rails_helper'
require 'rspec/rails'
require 'shoulda/matchers'

FactoryBot.use_parent_strategy = false

RSpec.describe Post, type: :model do
  describe '#new' do
    context 'when not logged in' do
      it 'redirects to sign in page' do
        response.to redirect_to(sign_in_path)
      end
    end
  end
end
