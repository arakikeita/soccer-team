require 'rails_helper'


RSpec.describe Team, type: :model do
  before do
    @team = FactoryBot.build(:team)
  end


  describe 'チーム作成機能' do
    context 'チーム作成できる時' do
      it '全て入力されていると作成ができる' do
        expect(@team).to be_valid
      end

      it '画像が入力されてなくても作成できる' do
        @team.image = nil
        expect(@team).to be_valid
      end
    
    end

    context 'チーム作成できない時' do
      it 'team_nameが空だと出品できない' do 
        @team.team_name = ''
        @team.valid?
        expect(@team.errors.full_messages).to include("Team name can't be blank")          
      end
      it 'nameが空だと出品できない' do
        @team.name = ''
        @team.valid?
        expect(@team.errors.full_messages).to include("Name can't be blank")
      end
      it 'introductionが空だと出品できない' do
        @team.introduction = ''
        @team.valid?
        expect(@team.errors.full_messages).to include("Introduction can't be blank")
      end
      
      it 'area_idが1だと出品できない' do
        @team.area_id = 1
        @team.valid?
        expect(@team.errors.full_messages).to include("Area can't be blank")
      end

      it 'owner_idが空だと出品できない' do
        @team.owner_id = ''
        @team.valid?
        expect(@team.errors.full_messages).to include("Owner can't be blank")
      end

    end
  end
end
