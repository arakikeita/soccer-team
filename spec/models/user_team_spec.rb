require 'rails_helper'

RSpec.describe UserTeam, type: :model do
  
  before do
    @userteam = FactoryBot.build(:user_team)
  end

  describe 'チーム参加' do
    
      context 'チーム参加できるとき' do
      
      
      
      end

      context 'チーム参加できないとき' do
        it 'email一意性がないと登録できない' do
          binding.pry
          @userteam.save
          another_userteam = FactoryBot.build(:user_team)
          another_userteam.user_id = @userteam.user_id
          another_userteam.team_id = @userteam.team_id

          another_userteam.valid?
          expect(another_userteam.errors.full_messages).to include("Email has already been taken")
        end
      end








  end
end
