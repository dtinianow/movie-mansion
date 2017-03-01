RSpec.describe Showtime, type: :model do
  it { is_expected.to belong_to(:movie) }
  it { is_expected.to belong_to(:auditorium) }
  it { is_expected.to validate_presence_of(:movie) }
  it { is_expected.to validate_presence_of(:auditorium) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:tickets_available) }
end
