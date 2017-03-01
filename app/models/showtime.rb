class Showtime < ApplicationRecord
  belongs_to :movie
  belongs_to :auditorium
  validates :movie, presence: true
  validates :auditorium, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :price, presence: true
  validates :tickets_available, presence: true
end
