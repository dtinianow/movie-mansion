RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:showtime) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:showtime_id) }
end
