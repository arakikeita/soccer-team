class AttendsController < ApplicationController

  def create
    attend = Attend.create(attend_params)
    redirect_to "/calenders/#{attend.calender_id}"
  end

  

  private
  def attend_params
  params.require(:attend).permit(:attendance_id).merge(user_id: current_user.id, calender_id: params[:calender_id])
  end

end
