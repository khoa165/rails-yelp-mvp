# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
12.times do
  new_restaurant = Restaurant.create(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    phone_number: Faker::Company.duns_number,
    category: %w(chinese italian japanese french belgian).sample
  )
  Random.rand(5..10).times do
    new_review = Review.new(
      customer_name: Faker::Name.name,
      content: Faker::Lorem.paragraph(sentence_count: Random.rand(8..10), supplemental: true, random_sentences_to_add: 5),
      rating: (0..5).to_a.sample
    )
    new_review.restaurant = new_restaurant
    new_review.save
  end
end

puts 'Finished!'
