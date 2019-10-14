# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Logged out user Inspects the webapp' do
  scenario 'clicks all the available links' do
    visit unauthenticated_root_path
    respond_to be_success
    click_link 'Log in'
    respond_to be_success
    click_link 'Sign Up'
    respond_to be_success
  end
end