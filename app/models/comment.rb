class Comment < ApplicationRecord
  belongs_to :team 
  belongs_to :user
  belongs_to :game
  



  with_options presence: true do
    validates :content
  end









  
end
