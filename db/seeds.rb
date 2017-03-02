class Seeder
  def seed
    Order.destroy_all
    Showtime.destroy_all
    Auditorium.destroy_all
    Movie.destroy_all
    create_seeds
  end

  def create_seeds
    create_movies
    create_auditoriums
    create_showtimes
    create_orders
  end

  def create_movies
    8.times do |i|
      movie = Movie.create!(
      title: Faker::Book.title,
      minutes: Faker::Number.between(50, 250),
      rating: ['G', 'PG', 'PG-13', 'R'].sample,
      genre: Faker::Book.genre,
      image_url: "https://robohash.org/#{rand(10)}"
      )
      puts "Created Movie #{movie.title}"
    end
  end

  def create_auditoriums
    8.times do |i|
      auditorium = Auditorium.create!(
      title: Faker::Company.name,
      capacity: Faker::Number.between(60, 300)
      )
      puts "Created Auditorium #{auditorium.title}"
    end
  end

  def create_showtimes
    m = Movie.all.to_a
    a = Auditorium.all.to_a
    400.times do |i|
      movie = m.rotate!.first
      auditorium = a.rotate!.first
      start_time = Faker::Time.between(Date.today, 4.weeks.from_now, :all)
      showtime = Showtime.create!(
        movie: movie,
        auditorium: auditorium,
        price: Faker::Number.decimal(2),
        tickets_available: Faker::Number.between(0, auditorium.capacity),
        start_time: start_time,
        end_time: start_time + movie.minutes.minutes
      )
      puts "Created Showtime #{showtime.id}"
    end
  end

  def create_orders
    s = Showtime.all.to_a
    30.times do |i|
      showtime = s.rotate!.first
      order = Order.create!(
        showtime: showtime,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email
      )
      puts "Created Order #{order.id}"
    end
  end
end

seeder = Seeder.new
seeder.seed
