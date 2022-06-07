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
end
