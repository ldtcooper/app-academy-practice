require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET#new" do
    xit "renders sign in page" do
      get :new
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST#create" do
    before(:each) do
      User.create!(username: "JohnDoe", password: "password")
      @user = User.find_by(name: "JohnDoe")
    end

    context "with valid credentials" do
      xit "signs user in" do
        get :create, params: { user: {username: "JohnDoe", password: "password"} }
        expect(session[:session_token]).to eq(@user.session_token)
      end

      xit "redirects user" do

      end
    end

    context "with invalid credentials" do
      xit "returns to sign-in with non-existant user" do
        get :create, params: { user: { username: "JaneDoe", password: "password"} }
        expect(response).to render_template("new")
        expect flash[:errros].to be_present
      end

      xit "returns to sign-in with invalid password" do
        get :create, params: { user: {username: "JohnDoe", password: "sadljfgadfjg" } }
        expect(response).to render_template("new")
        expect flash[:errros].to be_present
      end
    end
  end

  describe 'DELETE#destroy' do
    before(:each) do
      get :create, params: { user: {username: "JohnDoe", password: "password" } }
      @session_token = User.find_by(username: "JohnDoe").session_token
    end
    
    xit "signs user out" do
      get :delete
      john = User.find_by(username: "JohnDoe")
      expect(@session_token).to_not eq(john.session_token)
    end
  end
end
