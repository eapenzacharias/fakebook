# frozen_string_literal: true

require 'rails_helper'
require 'rspec/rails'
require 'shoulda/matchers'

RSpec.describe Post, type: :model do
  before(:each) do
    @post = posts.build(post_params)
  end
end
