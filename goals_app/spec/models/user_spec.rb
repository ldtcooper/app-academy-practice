require 'rails_helper'

RSpec.describe User, type: :model do
  # validations
  describe 'validations' do
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

  # methods
  describe 'password encryption' do
    it 'does not save passwords as plain text'
  end
end
