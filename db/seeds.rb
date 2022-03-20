# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Question.create(question_description: "Are you a party person?", answer_description: "0 - Never party. 10 -Party crazy!")

Question.create(question_description: "About politics:", answer_description: "0 - Left. 10 - Right.")

Question.create(question_description: "What about the differences?", answer_description: "0 - I prefer people alike. 10 - I like what diverges")

Question.create(question_description: "About drugs:", answer_description: "0 - Against it. 10 - Open about it.")

Question.create(question_description: "What about your habits?", answer_description: "0 - A few friends and a lot of Netflix. 10 - Socially active and always up for adventure!")
