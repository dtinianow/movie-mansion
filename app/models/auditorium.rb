class Auditorium < ApplicationRecord
  validates :title, presence: true
  validates :capacity, presence: true
end
