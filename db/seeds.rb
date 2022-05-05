# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create(title: 'Iron Man', rating: 'PG-13', total_gross: 585_366_247)
Movie.create(title: 'Superman', rating: 'PG', total_gross: 300_451_603)
Movie.create(title: 'Spider-Man', rating: 'PG-13', total_gross: 825_025_036)
