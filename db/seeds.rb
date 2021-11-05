# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

Product.create!([{
    name: "coffee mug",
    price: 199,
    imported: true,
    exempt: false
},
{
    name: "wallet",
    price: 5499,
    imported: true,
    exempt: true
},
{
    name: "chocolate",
    price: 199,
    imported: false,
    exempt: false
},
{
    name: "backpack",
    price: 7999,
    imported: true,
    exempt: false
},
{
    name: "wine",
    price: 2499,
    imported: false,
    exempt: true
},
{
    name: "book",
    price: 1799,
    imported: false,
    exempt: false
},
{
    name: "pen",
    price: 399,
    imported: true,
    exempt: false
},
{
    name: "picture frame",
    price: 1999,
    imported: true,
    exempt: false
},
{
    name: "magazine",
    price: 899,
    imported: false,
    exempt: false
},
{
    name: "lamp",
    price: 3599,
    imported: true,
    exempt: false
}])

puts "Created #{Product.count} products"