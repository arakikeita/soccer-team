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

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to action: :index
    else
      render "edit"
    end
  end


  def destroy
    @game = Game.find(params[:id])
    @game.delete
    redirect_to action: :index
  end


  private

  def game_params
    params.require(:game).permit(:title, :content, :start_time,:end_time,:place).merge(user_id: current_user.id,team_id: params[:team_id])
  end




end
