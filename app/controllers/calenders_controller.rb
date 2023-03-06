class CalendersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:new, :create, :edit, :update,:show, :destroy]
  
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
   
  end

  def edit
   
  end

  def update
   
    if @calender.update(calender_params)
      redirect_to action: :index
    else
      render "edit"
    end
  end

  def destroy
    @calender.delete
    redirect_to teams_path
  end

  private

  def calender_params
    params.require(:calender).permit(:title, :content, :start_time).merge(user_id: current_user.id,team_id: params[:team_id])
  end


  def set_calender
    @item = Calender.find(params[:id])
  end


  def moves_to_index
    unless UserTeam.exists?(team_id: @calender.team_id, user_id: current_user.id)
      redirect_to action: :index
    end
  end

end
