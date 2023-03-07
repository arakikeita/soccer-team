class Attend < ApplicationRecord

  belongs_to :user
  belongs_to :calender

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :attendance


  validates :attendance_id, numericality: { other_than: 0}
  validates :calender_id, uniqueness: { scope: :user } ##一人のユーザーは同じスケジュールに複数保存できない。
  
end
