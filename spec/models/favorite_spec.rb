# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    let!(:movie) { create(:movie) }
    let!(:user) { create(:user) }

    subject { Favorite.create(user_id: user.id, movie_id: movie.id) }
    it { should validate_uniqueness_of(:movie_id).scoped_to(:user_id) }
  end
end
