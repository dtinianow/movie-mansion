RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:showtime) }
  it { is_expected.to validate_presence_of(:showtime) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }

  it 'should select all orders based on a specific movie' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime, movie: movie, auditorium: auditorium)
    create(:order, showtime: showtime)

    orders = Order.select_by_movie(movie.id)
    order = orders.last

    expect(order.class).to eq(Order)
    expect(order['first_name']).to eq('David')
    expect(order['last_name']).to eq('T')
    expect(order['email']).to eq('david@example.com')
    expect(order.showtime).to eq(showtime)
  end
end
