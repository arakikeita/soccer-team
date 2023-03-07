class AttendsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:destroy]
  before_action :set_attend,only: [:destroy]
  before_action :move_to_index, only: [:destroy]

  def create
    attend = Attend.create(attend_params)
    redirect_to "/calenders/#{attend.calender_id}"
  end

  def destroy
    @calender = Calender.find(params[:calender_id])
    
    @attend.destroy
    redirect_to "/calenders/#{@attend.calender_id}"
  
  end


    private
  def attend_params
  params.require(:attend).permit(:attendance_id).merge(user_id: current_user.id, calender_id: params[:calender_id])
  end

  def set_attend
    @attend = Attend.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @attend.user_id
      redirect_to action: :index
    end
  end

end
