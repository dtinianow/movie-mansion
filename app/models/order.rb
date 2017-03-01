class Order < ApplicationRecord
  belongs_to :showtime
  
  attr_accessor :card_number, :card_exp_date
end
