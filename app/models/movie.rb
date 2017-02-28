class Movie < ApplicationRecord
  has_many :showtimes

  def self.showings_on_date(date)
    joins(:showtimes)
      .where(showtimes: { start_time: date.midnight..date.end_of_day })
  end
end
