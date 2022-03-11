# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = [
  "How do you perceive drug use? 0 - Totally against it. 10 - Super open about it.",
  "How much of a party person are you? 0 - Never party. 10 -Party crazy!",
  "How do you describe your food habits? 0 - Don't mind about it at all. 10 - Dedicate a lot to a healthy diet.",
  "Do you invite friends over? 0 - Never have friends at home. 10 - Like to host parties and/or dinners every week.",
  "Do you practice sports? 0 - Not active at all. 10 - Sports on a daily basis.",
  "How political are you? 0 - Don't mind about it at all. 10 Extremely into politics and always up to discuss social issues.",
  "How much is music present in your life? 0 - Don't care about it. 10 - Listen to loud music most of the day.",
  "How would you describe yourself in a sense of personal freedom? 0 - Conservative and prefer to live with people of the same mentality. 10 - Open minded about any kind of personal choices.",
  "Are you an early bird or a night owl? 0 Sleep in the sunshine. 10 - Awake before the sunshine.",
  "How is your alcohol consumption? 0 - Don't drink and don't like it. 10 - Drink every day."
]
questions.each do |question|
  Question.create(question_description: question)
end
