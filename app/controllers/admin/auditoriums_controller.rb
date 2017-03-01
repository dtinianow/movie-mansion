class Admin::AuditoriumsController < Admin::BaseController
  def index
    @auditoriums = Auditorium.all
  end

  def new
    @auditorium = Auditorium.new
  end

  def create
    auditorium = Auditorium.new(auditorium_params)
    if auditorium.save
      flash[:success] = 'Auditorium successfully created!'
      redirect_to admin_auditoriums_path
    else
      flash.now[:danger] = 'Oops! Something went wrong.'
      render :new
    end
  end

  def edit
    @auditorium = Auditorium.find(params[:id])
  end

  def update
    auditorium = Auditorium.find(params[:id])
    if auditorium.update(auditorium_params)
      flash[:success] = 'Auditorium successfully updated!'
      redirect_to admin_auditoriums_path
    else
      flash.now[:danger] = 'Oops! Something went wrong.'
      render :edit
    end
  end

  private

  def auditorium_params
    params.require(:auditorium).permit(:title, :capacity)
  end
end
