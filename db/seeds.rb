# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Tracking.create(
  workout: "Bench Press",
  weight: 10,
  sets: 20,
  reps: 30
)

Tracking.create(
  workout: "Tricep Cables",
  weight: 20,
  sets: 40,
  reps: 50
)
