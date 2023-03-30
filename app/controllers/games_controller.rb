class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:new, :create, :edit, :update,:show, :destroy]
  before_action :set_game,only: [:show, :edit,:update, :destroy]
  before_action :move_to_index, only: [:edit,:destroy]
  
  
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
    @comment = Comment.new
    @comments = @game.comments.includes(:user)
  end

  def edit
   
  end

  def update
    
    if @game.update(game_params)
      redirect_to action: :index
    else
      render "edit"
    end
  end


  def destroy

    @game.destroy
    redirect_to action: :index
  end

  def search
    @game = Game.search(params[:keyword])
  end

  private

  def game_params
    params.require(:game).permit(:title, :content, :start_time,:end_time,:place).merge(user_id: current_user.id,team_id: params[:team_id])
  end

  def set_game
 
    @game = Game.find(params[:id])
  end


  def move_to_index
    unless current_user.id == @game.user_id
      redirect_to action: :index
    end
  end



end
