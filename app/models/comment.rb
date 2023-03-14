class Comment < ApplicationRecord
  belongs_to :team ,dependent: :destroy
  belongs_to :user
  belongs_to :game
  













  
end
