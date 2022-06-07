# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Characterization, type: :model do
  describe 'associtations' do
    it { should belong_to(:movie) }
    it { should belong_to(:genre) }
  end
end
