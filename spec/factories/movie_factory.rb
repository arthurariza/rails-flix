# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { 'Avengers: Endgame' }
    description do
      %(
      After the devastating events of Avengers: Infinity War, the universe
      is in ruins. With the help of remaining allies, the Avengers assemble
      once more in order to undo Thanos' actions and restore order to the universe.
    ).squish
    end
    released_on { '2019-04-26' }
    rating { 'PG-13' }
    total_gross { 1_223_641_414 }
    director { 'Anthony Russo' }
    duration { '181 min' }
    image_file_name { 'avengers-end-game.png' }
  end
end
