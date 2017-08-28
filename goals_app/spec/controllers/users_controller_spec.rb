require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET#new" do
    it "renders the new user page" do
      get :new
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST#create" do
    context "with valid params" do
      it "redirects user" do

      end
      it "logs user in" do
        get :create, params: { user: { username: "JohnDoe", password: "password" } }
        user = User.find_by(username: "JohnDoe")
        expect(session[:session_token]).to eq(user.session_token)
      end
    end

    context "with invalid params" do
      it "fails if field not filled in" do
        get :create, params: { user: { username: "", password: "password" } }
        expect flash[:errors].to be_present
      end

      it "fails if password too short" do
        get :create, params: { user: { username: "JohnDoe", password: "12345" } }
        expect flash[:errors].to be_present
      end
    end
  end
end
