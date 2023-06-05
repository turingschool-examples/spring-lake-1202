# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
@park_1 = AmusementPark.create!(name: "Fun land", admission_cost: 50)
@ride_1 = @park_1.rides.create!(name: "Twister", thrill_rating: 8, open: true)
@ride_2 = @park_1.rides.create!(name: "Snake", thrill_rating: 7, open: true)
@mechanic_1 = Mechanic.create(name: "Bill", years_experience: 12, ride_id: @ride_1.id)
RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_1)
