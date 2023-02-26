class TeamsController < ApplicationController
  ##before_action :authenticate_user! ##ログイン状態により表示ページを切り替える。ログインしていなければログイン画面に遷移する。
  before_action :ensure_correct_user, only: [:edit, :update] ##チームオーナーでないと更新できない。



  def index
    @team = Team.all
  end


  def new
    @team = Team.new
  end


  def create

    @team = Team.new(team_params)
    @team.owner_id = current_user.id
    @team.users << current_user

    ##@team.usersにcurrent_userを追加しているということ
    
    if @team.save
      redirect_to action: :index
    else
      render :new
    end       
  end

  def join
    @team = Team.find(params[:id])
    @team.users << current_user
    redirect_to action: :index
  end


  def edit
    @team = Team.find(params[:id])
  end

  def update
    if @team.update(team_params)
      redirect_to action: :index
    else
      render "edit"
    end
  end


  def show
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    ##current_userは、@team.userから消されると記述
    @team.users.delet(current_user)
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :name, :area_id, :owner_id, user_ids: [])
  end

  def ensure_correct_user
    @team = Team.find(params[:id])
    unless @team.owner_id == current_user.id
      redirect_to groups_path
    end
  end
  




end
