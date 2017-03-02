class Auditorium < ApplicationRecord
  validates :title, presence: true
  validates :capacity, presence: true

  def self.all_titles
    all.map { |auditorium| [ auditorium.title, auditorium.id ] }
  end
end
