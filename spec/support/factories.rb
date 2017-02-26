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
    movie
    auditorium
    start_time DateTime.now
    # Add movie length time in minutes converted into seconds
    end_time { DateTime.now + (60 * "#{movie.minutes}".to_i) }
    price 10.00
    tickets_available 120
  end

  # factory :order do
  #   name 'David'
  #   email 'david@example.com'
  # end
end
