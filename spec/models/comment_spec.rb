require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'スケジュール作成' do
    context 'スケジュール作成できる時' do
      it '全て入力されていると作成ができる' do
        expect(@comment).to be_valid
      end
    
    end

    context 'スケジュール作成できない時' do
      it 'contentが空だと出品できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end
   
    end
  end
  
end
