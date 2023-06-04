# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all

# @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
# @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

# @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
# @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
# @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

# @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@mechanic_1 = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)
@mechanic_2 = Mechanic.create!(name: "John Doe", years_of_experience: 6)
@mechanic_3 = Mechanic.create!(name: "Jane Doe", years_of_experience: 12)
@mechanic_4 = Mechanic.create!(name: "Michael Mechanix", years_of_experience: 1)

@amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
@amusement_park_2 = AmusementPark.create!(name: "Knotts Berry Farm", admission_cost: 50)

@ride_1 = @amusement_park_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
@ride_2 = @amusement_park_1.rides.create!(name: "The Frog Hopper", thrill_rating: 5, open: false)
@ride_3 = @amusement_park_1.rides.create!(name: "Fahrenheit", thrill_rating: 4, open: false)
@ride_4 = @amusement_park_1.rides.create!(name: "The Kiss Raise", thrill_rating: 1, open: false)

@ride_5 = @amusement_park_2.rides.create!(name: "The Ride", thrill_rating: 7, open: false)
@ride_6 = @amusement_park_2.rides.create!(name: "The Other Ride", thrill_rating: 5, open: false)
@ride_7 = @amusement_park_2.rides.create!(name: "The Other Other Ride", thrill_rating: 4, open: false)
@ride_8 = @amusement_park_2.rides.create!(name: "The Otherest Ride", thrill_rating: 1, open: false)

@mechanic_1_ride_1 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
@mechanic_1_ride_2 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
@mechanic_1_ride_3 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)

@mechanic_2_ride_4 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_4.id)

@mechanic_3_ride_5 = MechanicRide.create!(mechanic_id: @mechanic_3.id, ride_id: @ride_5.id)
@mechanic_3_ride_6 = MechanicRide.create!(mechanic_id: @mechanic_3.id, ride_id: @ride_6.id)
@mechanic_4_ride_7 = MechanicRide.create!(mechanic_id: @mechanic_4.id, ride_id: @ride_7.id)
@mechanic_4_ride_8 = MechanicRide.create!(mechanic_id: @mechanic_4.id, ride_id: @ride_8.id)