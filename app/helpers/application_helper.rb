module ApplicationHelper
  def tickets_available?(showtime)
    showtime.tickets_available > 0
  end
end
