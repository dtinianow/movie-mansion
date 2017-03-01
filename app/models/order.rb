class Order < ApplicationRecord
  belongs_to :showtime
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :showtime_id, presence: true

  attr_accessor :card_number, :card_exp_date
end
