require 'rails_helper'

RSpec.describe Calender, type: :model do
  
  before do
    @calender = FactoryBot.build(:calender)
  end

  describe 'スケジュール作成' do
    context 'スケジュール作成できる時' do
      it '全て入力されていると作成ができる' do
        expect(@calender).to be_valid
      end
    
    end

    context 'スケジュール作成できない時' do
      it 'titleが空だと出品できない' do 
        @calender.title = ''
        @calender.valid?
        expect(@calender.errors.full_messages).to include("Title can't be blank")          
      end
      it 'contentが空だと出品できない' do
        @calender.content = ''
        @calender.valid?
        expect(@calender.errors.full_messages).to include("Content can't be blank")
      end
   
    end
  end
  
end
