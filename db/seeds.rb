# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create(title: 'Iron Man', rating: 'PG-13', total_gross: 585_366_247,
             description: 'Tony Stark builds an armored suit to fight the throes of evil', released_on: '2008-05-02')
Movie.create(title: 'Superman', rating: 'PG', total_gross: 300_451_603,
             description: 'Clark Kent grows up to be the greatest super-hero', released_on: '1978-12-15')
Movie.create(title: 'Spider-Man', rating: 'PG-13', total_gross: 825_025_036,
             description: 'Peter Parker gets bitten by a genetically modified spider', released_on: '2002-05-03')
Movie.create(title: 'Fantastic Four', rating: 'PG-13', total_gross: 168_257_860,
             description: 'Four young outsiders teleport to an alternate and dangerous universe', released_on: '2015-08-07')
