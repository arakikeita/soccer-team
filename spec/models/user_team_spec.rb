require 'rails_helper'

RSpec.describe UserTeam, type: :model do
  
  before do
    @userteam = FactoryBot.build(:user_team)
  end

  describe 'チーム参加' do
    
      context 'チーム参加できるとき' do
       
          team = FactoryBot.create(:team)
          user = FactoryBot.create(:user)
          @userteams = FactoryBot.build(:user_team, team_id: team.id, user_id: user.id)
          expect(@userteams).to be_valid
        end
      end

      context 'チーム参加できないとき' do
        it 'すでに保存されているtea_idとuser_idがあると作成できない' do
    
          team = FactoryBot.create(:team)
          user = FactoryBot.create(:user)
          @userteams = FactoryBot.create(:user_team, team_id: team.id, user_id: user.id)
          another_userteams = FactoryBot.build(:user_team)
          another_userteams.user_id = @userteams.user_id
          another_userteams.team_id = @userteams.team_id

          another_userteams.valid?
          expect(another_userteams.errors.full_messages).to include("User has already been taken")
        end

        it 'すでに保存されているtea_idとuser_idがあると作成できない' do
          
          team = FactoryBot.create(:team)
          user = FactoryBot.create(:user)
          @userteams = FactoryBot.create(:user_team, team_id: team.id, user_id: user.id)
          another_userteams = FactoryBot.build(:user_team)
          another_userteams.user_id = @userteams.user_id
          another_userteams.team_id = @userteams.team_id

          another_userteams.valid?
          expect(another_userteams.errors.full_messages).to include("Team has already been taken")
        end
      end








  end
end
