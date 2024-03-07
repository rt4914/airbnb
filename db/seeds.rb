require 'open-uri'

description = <<-DESCRIPTION
<div>Explore the nature and art oasis at our unique property. The living room, a cozy masterpiece, and the fully equipped kitchen are ideal for cooking and entertaining. Step outside to our garden patio, unwind, and enjoy morning birdsong. Tastefully decorated bedrooms, a powder room, and utility area complete the experience.<br />Note: The property is surrounded by a residential area. Despite initial surroundings, I am sure that, stepping in will fill your mood with joy and happiness.
</div>
<h4 class="font-medium" tabindex="-1">The space</h4>
<p>Escape to a hidden gem in the heart of nature with our beautiful and artistic property. Our spacious and welcoming home is the perfect retreat for those looking to escape the hustle and bustle of the city and reconnect with nature.<br />As you enter through our beautifully adorned main gate with mandala art, you'll immediately feel a sense of peace and positive energy. The gate is an entryway to an amazing experience that is designed to help you unwind and relax.<br />Our living room is a work of art, with fascinating elements that create a cozy and unforgettable ambiance. The room features artistic designs, which are evident in the use of color, the decorations on the wall, and the unique furniture arrangement. The artistic flair adds a unique touch of elegance to the living room, making it the perfect place to spend time with family and friends. Our fully equipped kitchen is a modern open design with bamboo roofing, perfect for cooking and entertaining guests.<br />Step outside and experience the beauty of our garden patio, complete with a lush green view and the calming sounds of chirping birds in the morning. The patio is an extension of the living room, where you can enjoy your meals and relax in the fresh air. Fire up the barbecue in our cozy gazebo for a fun and relaxing evening with friends and family. The garden patio is the perfect place to unwind, read a book or just take a nap under the shade of a tree.<br />The bedrooms are spacious, comfortable, and tastefully decorated, with plenty of natural light, beautiful art pieces and a calming color scheme. The beds are comfortable, and the linens are soft and luxurious, providing you with the best possible sleeping experience.<br />Even our powder room and utility area have been designed with sustainability in mind. The utility area is a cleverly designed space that is efficient and has all the modern amenities required for your stay.<br />Note: The property is surrounded by a residential area. Despite initial surroundings, I am sure that, stepping in will fill your mood with joy and happiness.</p>
<h4 class="font-medium" tabindex="-1">Guest Policy</h4>
<p>Entire Property is yours!! Wish you fun and happy stay!!</p>
DESCRIPTION

amenities_data = [
  {name: 'Air conditioning', icon: "air_conditioning.svg"},
  {name: 'Balcony', icon: "balcony.svg"},
  {name: 'Bed linen', icon: "bed_linen.svg"},
  {name: 'Board games', icon: "board_games.svg"},
  {name: 'Carbon monoxide alarm', icon: "carbon_monoxide_alarm.svg"},
  {name: 'Coffee maker', icon: "coffee_maker.svg"},
  {name: 'Cooker', icon: "cooker.svg"},
  {name: 'Cooking basics', icon: "cooking_basics.svg", description: 'Pots and pans, oil, salt and pepper'},
  {name: 'Cot', icon: "cot.svg"},
  {name: 'Dedicated workspace', icon: "dedicated_workspace.svg"},
  {name: 'Dining table', icon: "dining_table.svg"},
  {name: 'Dishes and cutlery', icon: "dishes_and_cutlery.svg", description: 'Bowls, chopsticks, plates, cups, etc.'},
  {name: 'Dishwasher', icon: "dishwasher.svg"},
  {name: 'Dryer', icon: "dryer.svg"},
  {name: 'Esssentials', icon: "essentials.svg", description: 'Towels, bed sheets, soap and toilet paper'},
  {name: 'Fire extinguisher', icon: "fire_extinguisher.svg"},
  {name: 'First aid kit', icon: "first_aid_kit.svg"},
  {name: 'Free parking', icon: "free_parking.svg"},
  {name: 'fridge', icon: "fridge.svg"},
  {name: 'Garden', icon: "garden.svg", description: 'An open space on the property usually covered in grass'},
  {name: 'Hair dryer', icon: "hair_dryer.svg"},
  {name: 'Hangers', icon: "hangers.svg"},
  {name: 'Heating', icon: "heating.svg"},
  {name: 'Hot tub', icon: "hot_tub.svg"},
  {name: 'Hot water', icon: "hot_water.svg"},
  {name: 'Iron', icon: "iron.svg"},
  {name: 'Kitchen', icon: "kitchen.svg", description: 'Space where guests can cook their own meals'},
  {name: 'Lockbox', icon: "lockbox.svg"},
  {name: 'Microwave', icon: "microwave.svg"},
  {name: 'Mountain view', icon: "mountain_view.svg"},
  {name: 'Oven', icon: "oven.svg"},
  {name: 'Pool table', icon: "pool_table.svg"},
  {name: 'Private entrance', icon: "private_entrance.svg", description: 'Separate street or building entrance'},
  {name: 'Private pool', icon: "private_pool.svg" },
  {name: 'Shampoo', icon: "shampoo.svg"},
  {name: 'Smoke alarm', icon: "smoke_alarm.svg"},
  {name: 'TV', icon: "tv.svg"},
  {name: 'Washing machine', icon: "washing_machine.svg"},
  {name: 'Wifi', icon: "wifi.svg"},
]

amenities_data.each do |data|
  amenity = Amenity.create!(name: data[:name], icon: data[:icon], description: data[:description])
end

pictures = []
20.times do 
  pictures << URI.parse(Faker::LoremFlickr.image).open
end

user = User.create!({
  email: 'test1@gmail.com',
  password: '123456'
})

profile = Profile.create!({
  name: Faker::Lorem.unique.sentence(word_count: 3),
  address_1: Faker::Address.street_address,
  address_2: Faker::Address.street_name,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country,
  user_id: user.id
})

profile.picture.attach(io: pictures[0], filename: profile.name)
# user.avatar.attach(io: URI.parse(Faker::LoremFlickr.image).open, filename: "user_#{user.id}_avatar.jpg")

19.times do |i|
  random_user = User.create!(
    {
      email: "test#{i + 2}@gmail.com",
      password: '123456'
    }
  )

  random_profile = Profile.create!(
    {
      name: Faker::Lorem.unique.sentence(word_count: 3),
      address_1: Faker::Address.street_address,
      address_2: Faker::Address.street_name,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
      user_id: random_user.id
    }
  )

  random_profile.picture.attach(io: pictures[i + 1], filename: random_profile.name)
end

6.times do |i|
  property = Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    description: description,
    headline: Faker::Lorem.unique.sentence(word_count: 6),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount((50..100).to_a.sample, 'USD'),
    bedroom_count: (2..5).to_a.sample,
    bed_count: (4..10).to_a.sample,
    guest_count: (4..20).to_a.sample,
    bathroom_count: (1..4).to_a.sample,
  })

  property.images.attach(io: File.open("db/images/property_#{i + 1}.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_7.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_8.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_9.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_10.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_11.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_12.png"), filename: property.name)

  amenity_set = Set.new
  ((10..(amenities_data.length() - 1)).to_a.sample).times do
    amenity = Amenity.all.sample
    unless amenity_set.include?(amenity.id)
      property.amenities << amenity
      amenity_set << amenity.id
    end
  end

  ((5..10).to_a.sample).times do
    Review.create!({
      content: Faker::Lorem.paragraph(sentence_count: 10),
      cleanliness_rating: (1..5).to_a.sample,
      accuracy_rating: (1..5).to_a.sample,
      checkin_rating: (1..5).to_a.sample,
      communication_rating: (1..5).to_a.sample,
      location_rating: (1..5).to_a.sample,
      value_rating: (1..5).to_a.sample,
      property: property,
      user: User.all.sample
    })
  end
end
