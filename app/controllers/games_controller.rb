class GamesController < ApplicationController

  def index
    @game = Game.all
  end

  def new
    @game = Game.new
  end


  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to action: :index
    else
      render :new
    end
  end



  def game_params
    params.require(:game).permit(:title, :content, :start_time,:end_time,:place).merge(user_id: current_user.id,team_id: params[:team_id])
  end




end
