class Admin::AuditoriumsController < Admin::BaseController
  def index
    @auditoriums = Auditorium.all
  end
end
