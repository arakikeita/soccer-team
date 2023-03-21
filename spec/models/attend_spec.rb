require 'rails_helper'

RSpec.describe Attend, type: :model do
  before do
    @attend = FactoryBot.build(:attend)
  end

  describe '出欠作成' do
    context '出欠作成できる時' do
      it '全て入力されていると作成ができる' do
        expect(@attend).to be_valid
      end
    
    end

    context '出欠作成できない時' do
      it 'attendance_idが0だと作成できない' do
        @attend.attendance_id = 0
        @attend.valid?
        expect(@attend.errors.full_messages).to include("Attendance must be other than 0")
      end

      it 'すでに保存されているcalender_idとuser_idと同じだと作成できない' do
       
        @attend.save
        another_user = FactoryBot.build(:attend)
        another_user.user_id = @attend.user_id
        another_user.calender_id = @attend.calender_id
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Calender has already been taken")
      end
    end
  end
end
