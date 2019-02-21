# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
addresses = [ {street: 'street1', city: 'city1', zip_code: '123451' },
              {street: 'street2', city: 'city2', zip_code: '123452' },
              {street: 'street3', city: 'city3', zip_code: '123453' },
              {street: 'street4', city: 'city4', zip_code: '123454' },
              {street: 'street5', city: 'city5', zip_code: '123455' },
              {street: 'street6', city: 'city6', zip_code: '123456' },
            ]
addresses.each do |address|
  Address.create!(address)
end
