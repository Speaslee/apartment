# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!([
  {email: "mike@example.com", first_name: "Mike", last_name: "Henry", aptnum: "123", phone: "202-867-5309", admin: true, password: "password", api_token: "TIY"},
  {email: "buwa@example.com", first_name: "Buwa", last_name: "Galpoththawela", aptnum: "124", phone: "800-649-2568", password: "password", api_token: "shophouse"}
  ])

  Repair.create!([
    {name: "Broken oven", description: "Oven is broken", user_id: 2}
    ])
