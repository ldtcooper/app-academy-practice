require 'rails_helper'

RSpec.describe User, type: :model do

  # methods
  describe 'password encryption' do

    User.create(username: "JohnDoe", password: "password")
    user = User.find_by(username: "JohnDoe")

    it 'does not save passwords as plain text' do
      expect(user.password).to_not be("password")
    end

    it "assigns session token" do
      expect(user.session_token).to_not be(nil)
    end
  end

  describe '::find_by_credentials' do
    User.create(username: "JohnDoe", password: "password")
    user = User.find_by(username: "JohnDoe")

    it "finds a user with correct credentials" do
      expect(User.find_by_credentials("JohnDoe", "password")).to eq(user)
    end

    it "returns nil for incorrect credentials" do
      expect(User.find_by_credentials("djkgfdag", "password")).to be(nil)
      expect(User.find_by_credentials("JohnDoe", "assword")).to be(nil)
    end
  end

  # validations
  describe 'validations' do
    # User.create!(username: "JohnDoe", password: "password")
    context 'username' do
      it { should validate_presence_of(:username) }
      it { should validate_uniqueness_of(:username) }
    end

    context 'password_digest' do
      it { should validate_presence_of(:password_digest) }
    end

    context 'session_token' do
      it { should validate_presence_of(:session_token) }
      it { should validate_uniqueness_of(:session_token) }
    end

    context 'password' do
      it { should validate_length_of(:password).is_at_least(6) }
    end
  end

end
