# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'associations' do
    it { should have_many(:characterizations).dependent(:destroy) }
    it { should have_many(:movies).through(:characterizations) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
