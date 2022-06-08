# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :review do
    comment { Faker::Lorem.paragraph }
  end
end
