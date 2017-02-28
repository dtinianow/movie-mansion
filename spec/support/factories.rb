FactoryGirl.define do
  factory :movie do
    title 'Ex Machina'
    minutes 108
    rating 'R'
    genre 'Sci-Fi'
    image_url 'https://c1.staticflickr.com/8/7649/17097191625_77c28cf79b_b.jpg'
  end

  factory :auditorium do
    title 'A'
    capacity 160
  end

  factory :showtime do
    date = DateTime.now.middle_of_day
    movie
    auditorium
    start_time date
    end_time { date + movie.minutes.minutes }
    price 10.00
    tickets_available 120
  end

  factory :order do
    first_name 'David'
    last_name 'T'
    email 'david@example.com'
  end
end
