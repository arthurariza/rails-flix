# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.unique.title }
    description { Faker::Lorem.paragraph }
    released_on { '2019-04-26' }
    rating { 'PG-13' }
    total_gross { 1_223_641_414 }
    director { Faker::Name.name }
    duration { '181 min' }
    image_file_name { 'avengers-end-game.png' }
  end
end
