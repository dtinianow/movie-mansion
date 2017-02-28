require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { is_expected.to have_many(:showtimes) }

  it 'should get movie showtimes on a specific date' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime,
      movie: movie,
      auditorium: auditorium
    )
    current_date = DateTime.now.middle_of_day

    movies = Movie.showings_on_date(current_date)
    showtime = movies.last.showtimes.last

    expect(movie.class).to eq(Movie)
    expect(movie['title']).to eq('Ex Machina')
    expect(showtime.class).to eq(Showtime)
    expect(showtime.start_time).to eq(current_date)
  end

  it 'should not return movies if there are no showtimes on that date' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime,
      movie: movie,
      auditorium: auditorium
    )
    tomorrow = DateTime.tomorrow.middle_of_day

    movies = Movie.showings_on_date(tomorrow)

    expect(movies.empty?).to be true
  end
end
