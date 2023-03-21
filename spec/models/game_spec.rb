require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @game = FactoryBot.build(:game)
  end

  describe '練習試合募集作成' do
    context '練習試合募集作成できる時' do
      it '全て入力されていると作成ができる' do
        expect(@game).to be_valid
      end
    
    end

    context '練習試合募集作成できない時' do
      it 'titleが空だと出品できない' do 
        @game.title = ''
        @game.valid?
        expect(@game.errors.full_messages).to include("Title can't be blank")          
      end
      it 'contentが空だと出品できない' do 
        @game.content = ''
        @game.valid?
        expect(@game.errors.full_messages).to include("Content can't be blank")          
      end
      it 'placeが空だと出品できない' do 
        @game.place = ''
        @game.valid?
        expect(@game.errors.full_messages).to include("Place can't be blank")          
      end
    
   
    end
  end
end
