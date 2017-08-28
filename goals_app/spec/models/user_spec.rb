require 'rails_helper'

RSpec.describe User, type: :model do
  # validations
  describe 'validations' do
    context 'username' do
      xit { should validate_presence_of(:username) }
      xit { should validate_uniqueness_of(:username) }
    end

    context 'password_digest' do
      xit { should validate_presence_of(:password_digest) }
    end

    context 'session_token' do
      xit { should validate_presence_of(:session_token) }
      xit { should validate_uniqueness_of(:session_token) }
    end

    context 'password' do
      xit { should validate_length_of(:password).is_at_least(6) }
    end
  end

  # methods
  describe 'password encryption' do
    before (:each) do
      User.create!(username: "JohnDoe", password: "password")
      user = User.find_by(username: "JohnDoe")
    end
    xit 'does not save passwords as plain text' do
      expect(user.password).to_not be("password")
    end

    xit "assigns session token" do
      expect(user.session_token).to_not be(nil)
    end
  end

  describe '::find_by_credentials' do
    xit "finds a user with correct credentials" do
      expect(User.find_by_credentials("JohnDoe", "password")).to be(user)
    end

    xit "returns nil for incorrect credentials" do
      expect(User.find_by_credentials("djkgfdag", "password")).to be(nil)
      expect(User.find_by_credentials("JohnDoe", "assword")).to be(nil)
    end
  end
end
