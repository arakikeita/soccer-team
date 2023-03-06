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

  def show
   @calender = Calender.find(params[:id])
  end

  def edit
    @calender = Calender.find(params[:id])
  end

  def update
    @calender = Calender.find(params[:id])
    if @calender.update(calender_params)
      redirect_to action: :index
    else
      render "edit"
    end
  end

  def destroy
    @calender = Calender.find(params[:id])
    ##current_userは、@team.userから消されると記述
    @calender.delete
    redirect_to teams_path
  end

  private

  def calender_params
    params.require(:calender).permit(:title, :content, :start_time).merge(user_id: current_user.id,team_id: params[:team_id])
  end

end
