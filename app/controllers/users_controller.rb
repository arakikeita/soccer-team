class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :destroy]
  
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    redirect_to :root #削除に成功すればrootページに戻る
  end



  private



  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user.id== current_user.id
      redirect_to root_path
    end
  end
  

end
