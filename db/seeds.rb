# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
RideMechanic.destroy_all
Ride.destroy_all
AmusementPark.destroy_all
Mechanic.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
@old_wooden = @universal.rides.create!(name: 'Old Wooden', thrill_rating: 8, open: true)

@mechanic1 = Mechanic.create!(name: "Wolfie", years_experience: 13)
@mechanic2 = Mechanic.create!(name: "Maggie", years_experience: 5)
@mechanic3 = Mechanic.create!(name: "Pirate", years_experience: 6)
@mechanic4 = Mechanic.create!(name: "Ink Jet Printer", years_experience: 3)
@mechanic5 = Mechanic.create!(name: "Neato", years_experience: 1)

@ride_mech1 = RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @mechanic1.id)
@ride_mech2 = RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @mechanic2.id)
@ride_mech3 = RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @mechanic1.id)
@ride_mech4 = RideMechanic.create!(ride_id: @old_wooden.id, mechanic_id: @mechanic3.id)
@ride_mech5 = RideMechanic.create!(ride_id: @ferris.id, mechanic_id: @mechanic4.id)
@ride_mech6 = RideMechanic.create!(ride_id: @old_wooden.id, mechanic_id: @mechanic5.id)
@ride_mech7 = RideMechanic.create!(ride_id: @old_wooden.id, mechanic_id: @mechanic2.id)
@ride_mech8 = RideMechanic.create!(ride_id: @old_wooden.id, mechanic_id: @mechanic1.id)
@ride_mech9 = RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @mechanic3.id)