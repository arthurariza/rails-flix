# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    subject { Favorite.create(user_id: 1, movie_id: 1) }
    it { should validate_uniqueness_of(:movie_id).scoped_to(:user_id) }
  end
end
