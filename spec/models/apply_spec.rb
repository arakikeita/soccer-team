require 'rails_helper'

RSpec.describe Apply, type: :model do
  before do
   
    @apply = FactoryBot.build(:apply)
   

  end

  describe '申込作成' do
    context '申込作成できる時' do
      it '全て入力されていると作成ができる' do
        expect(@apply).to be_valid
      end
    
    end

    context '申込作成できない時' do
      it 'すでに保存されているcalender_idとuser_idと同じだと作成できない' do
        team = FactoryBot.create(:team)
        @applys = FactoryBot.create(:apply, team_id: team.id)
        another_user = FactoryBot.build(:apply)
        another_user.user_id = @applys.user_id
        another_user.team_id = @applys.team_id
        another_user.valid?
        expect(another_user.errors.full_messages).to include("User has already been taken")
      end
      it 'すでに保存されているcalender_idとuser_idと同じだと作成できない' do
        team = FactoryBot.create(:team)
        @applys = FactoryBot.create(:apply, team_id: team.id)
        another_user = FactoryBot.build(:apply)
        another_user.user_id = @applys.user_id
        another_user.team_id = @applys.team_id
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Team has already been taken")
      end
    end
  end
end
