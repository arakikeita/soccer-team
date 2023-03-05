class CalendersController < ApplicationController
  def index
    @events = Calender.all
  end

  def new 
    @calender = Calender.new
  end 

  def create
    @calender = Calender.new(calender_params)
    if @calender.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def calender_params
    params.require(:calender).permit(:title, :content, :start_time).merge(user_id: current_user.id,team_id: params[:team_id])
  end

end
