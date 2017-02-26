class Showtime < ApplicationRecord
  belongs_to :movie
  belongs_to :auditorium
end
