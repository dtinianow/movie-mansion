class Order < ApplicationRecord
  belongs_to :showtime
  validates :showtime, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  attr_accessor :card_number, :card_exp_date

  def self.select_by_movie(movie_id)
    joins(:showtime).where(showtimes: { movie_id: movie_id })
  end
end
