# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Mechanic.destroy_all
Ride.destroy_all
AmusementPark.destroy_all
MechanicRide.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
@mechanic_2 = Mechanic.create!(name: "John Doe", years_experience: 4)

@park_1 = AmusementPark.create!(name: "Hershey Park", admission_cost: 50)
@park_2 = AmusementPark.create!(name: "Cedar Point", admission_cost: 75)

@ride_1 = Ride.create!(name: "Lightning Racer", thrill_rating: 7, open: true, amusement_park_id: @park_1.id)
@ride_2 = Ride.create!(name: "Storm Runner", thrill_rating: 9, open: true, amusement_park_id: @park_1.id)
@ride_3 = Ride.create!(name: "The Great Bear", thrill_rating: 5, open: false, amusement_park_id: @park_2.id)
@ride_4 = Ride.create!(name: "The Kiss Raise", thrill_rating: 2, open: false, amusement_park_id: @park_1.id)
@ride_5 = Ride.create!(name: "Thunderbird", thrill_rating: 8, open: true, amusement_park_id: @park_2.id)

@mechanic_ride_1 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
@mechanic_ride_2 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
@mechanic_ride_3 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)
@mechanic_ride_4 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_4.id)
@mechanic_ride_5 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_5.id)