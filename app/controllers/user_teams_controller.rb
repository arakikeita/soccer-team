class UserTeamsController < ApplicationController

  def create
    @user_team = UserTeam.create(team_id: user_team_params[:team_id], user_id: user_team_params[:user_id])
    Apply.find(user_team_params[:apply_id]).destroy!
    redirect_to team_applies_url(@user_team.team), notice:"「#{@user_team.user.nickname}」が、コミュニティ：#{@user_team.team.team_name}へ加入しました。"
  end

  
  private

    def user_team_params
        params.permit(:team_id, :user_id, :apply_id)
    end




end
