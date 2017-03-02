class Movie < ApplicationRecord
  has_many :showtimes
  validates :title, presence: true
  validates :minutes, presence: true
  validates :rating, presence: true
  validates :genre, presence: true
  validates :image_url, presence: true

  def self.showings_on_date(date)
    joins(:showtimes)
      .where(showtimes: { start_time: date.midnight..date.end_of_day })
      .distinct
  end
end
