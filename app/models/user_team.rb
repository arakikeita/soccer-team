class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
 

  with_options presence: true do
    validates  :user_id, uniqueness: { scope: :team_id }
    validates  :team_id, uniqueness: { scope: :user_id }
  end
  
end
