class Calender < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :attends
  
end
