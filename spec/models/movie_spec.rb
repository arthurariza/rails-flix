# frozen_string_literal: true

require 'rails_helper'

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
end
