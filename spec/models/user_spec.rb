require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:reviews).dependent(:destroy) }
    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:favorite_movies).through(:favorites) }
  end

  describe 'validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('email@example.com').for(:email) }

    it {
      should validate_length_of(:password)
        .is_at_least(6)
        .allow_blank
    }
  end
end
