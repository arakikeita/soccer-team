class CommentsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    comment = Comment.create(comment_params)
    redirect_to "/games/#{comment.game.id}" 
  end

  private
  def comment_params
  params.require(:comment).permit(:content).merge(user_id: current_user.id, game_id: params[:game_id],team_id: @game[:team_id])
  
  end









end
