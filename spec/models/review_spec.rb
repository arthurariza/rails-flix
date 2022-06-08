# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_length_of(:comment).is_at_least(4) }

    it do
      should validate_inclusion_of(:stars)
        .in_array([1, 2, 3, 4, 5].freeze)
        .with_message(/must be between 1 and 5/)
    end
  end

  describe 'Review#stars_as_percent' do
    let!(:movie) { create(:movie) }
    let!(:user) { create(:user) }

    it 'result has one decimal case' do
      review = create(:review, movie_id: movie.id, user_id: user.id, stars: 3)

      expect(review.stars_as_percent).to eq 60.0
    end
  end
end
