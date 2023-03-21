class Calender < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :attends,dependent: :destroy
  
  with_options presence: true do
    validates :title
    validates :content
 
  end




end
