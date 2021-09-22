# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jsonfile = File.join(Rails.root, 'products.json')
products = JSON.parse(File.read(jsonfile))
products.each do |product|
    Product.create!(product)
end