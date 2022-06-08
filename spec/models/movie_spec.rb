# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Movie, type: :model do
  describe 'associations' do
    it { should have_many(:reviews).dependent(:destroy) }
    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:characterizations).dependent(:destroy) }
    it { should have_many(:fans).through(:favorites).source(:user) }
    it { should have_many(:genres).through(:characterizations) }
  end

  describe 'validations' do
    subject { create(:movie) }

    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:released_on) }
    it { should validate_presence_of(:duration) }
    it { should allow_value('image.png').for(:image_file_name) }
    it { should allow_value('image.jpg').for(:image_file_name) }
    it { should validate_numericality_of(:total_gross).is_greater_than_or_equal_to(0) }

    it do
      should validate_inclusion_of(:rating)
        .in_array(%w[G PG PG-13 R NC-17].freeze)
    end

    it {
      should validate_length_of(:description)
        .is_at_least(25)
    }
  end

  describe 'scopes' do
    before do
      create(:movie, released_on: 1.year.ago)
      create(:movie, released_on: 1.year.ago)
      create(:movie, released_on: 1.year.ago)
      create(:movie, released_on: 1.year.from_now)
      create(:movie, released_on: 1.year.from_now)
    end

    it 'shows only released movies' do
      expect(Movie.released.count).to eq 3
    end
    it 'shows only upcoming movies' do
      expect(Movie.upcoming.count).to eq 2
    end
  end

  describe 'Movie#flop?' do
    it 'total gross less than 250mil is a flop' do
      flopped_movie = create(:movie, total_gross: 249_999_999)

      expect(flopped_movie.flop?).to be true
    end

    it 'total gross greater than 250mil is not a flop' do
      movie = create(:movie, total_gross: 250_000_000)

      expect(movie.flop?).to be false
    end
  end

  describe 'Movie#average_stars' do
    let!(:movie) { create(:movie) }
    let!(:user) { create(:user) }

    it 'defaults to 0.0 when no reviews' do
      expect(movie.average_stars).to eq 0.0
    end

    it 'calculates the average stars for a movie' do
      create(:review, movie_id: movie.id, user_id: user.id, stars: 5)
      create(:review, movie_id: movie.id, user_id: user.id, stars: 2)

      expect(movie.average_stars).to eq 0.35e1
    end
  end
end
