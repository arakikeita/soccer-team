class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    redirect_to :root #削除に成功すればrootページに戻る
  end
  

end
