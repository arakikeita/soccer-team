class AppliesController < ApplicationController

  def create
    current_user.applies.create(team_id: apply_params[:team_id])
    redirect_to team_url(apply_params[:team_id]), notice: "加入申請しました"
  end


  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy!
    @team = Team.find(params[:team_id])
    redirect_to team_url(@team), notice: "加入申請を取り消しました"
  end

  def index
    @applies = Apply.where(team_id: params[:team_id])
  end

  private

    def apply_params
      params.permit(:team_id)
    end

end
