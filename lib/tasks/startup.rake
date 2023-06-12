require 'rake'

namespace name :startup do
desc 'this task creates the admin user, you need to provide the email and password'
    task :print_hello, [:email, :password] => :environment do |_, args|
        args.with_defaults(:password => ENV['ADMIN_PASSWORD'])
        user = User.create(user_name: 'admin', email: args[:email], password: args[:password])
        if user.errors.any?
            p user.errors.full_messages
        end
    end
end

#Create a rails API call it search pokemon API
#Create a rake task that fetches pokemons and berries from the pokeapi
#Rake task receives 2 args: 
#   a) num of pokemons to fetch from API (by default 150)
#   b) um of berries to fetch from api (by default 60)

#Create three models: pokemon, pokemon-types and berries model for storing objects
#Pokemon: number, name, url to image, types of the pokemon
#Pokemon-types: name
#Berries: number, growth time, size, smoothness

#You will need to develop 3 endpoints:
#   1. Searching pokemons with filters
#       a) type
#       b) starts with name: bulbasaur - bulb
#   2. Searching pokemons by number or full name
#   3. Searching berries with interval filters
#       a) growth time: interval(1,3)
#       b) size
#       c) smoothness

#Implement pagination (gem will_paginate), the page size is 5