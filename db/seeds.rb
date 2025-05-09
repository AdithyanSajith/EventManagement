host = Host.create!(
  organisation: "TechCo",
  bio: "We host tech events",
  website: "https://techco.com",
  number: "1234567890"
)

venue = Venue.create!(
  name: "City Hall",
  address: "Main St",
  city: "Bangalore",
  capacity: 200,
  zipcode: "560001"
)

genre = Genre.create!(
  name: "Tech",
  genre_type: 0,
  description: "Technology-based events"
)

Event.create!(
  title: "AI Summit",
  description: "Exploring AI",
  starttime: Time.now + 1.day,
  endtime: Time.now + 2.days,
  host: host,
  venue: venue,
  genre: genre
)
