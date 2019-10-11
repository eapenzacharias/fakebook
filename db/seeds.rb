# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!( name: 'george',
              l_name: 'jungle',
              email: 'george@email.com',
              password: 'foobar',
              password_confirmation: 'foobar')

User.create!( name: 'sam',
              l_name: 'goody',
              email: 'sam@email.com',
              password: 'foobar',
              password_confirmation: 'foobar')

User.create!( name: 'tammy',
              l_name: 'sunshine',
              email: 'tammy@email.com',
              password: 'foobar',
              password_confirmation: 'foobar')
