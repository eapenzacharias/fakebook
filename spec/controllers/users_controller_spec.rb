require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "#show" do
        before(:each) do
          @user = create(:user)
        end
    
        it "assigns @user" do
          get :show, params: { id: @user.id }
          expect(assigns(:user)).to eql(@user)
        end
    
        #it "assigns @recent_posts" do
        #  get :show, params: { id: @user.id }
        #  expect(assigns(:recent_posts).length).to eql(0)
        #  
        #  create(:post, author: @user)
        #  get :show, params: { id: @user.id }
        #  expect(assigns(:recent_posts).length).to eql(1)
        #end
      end
end
