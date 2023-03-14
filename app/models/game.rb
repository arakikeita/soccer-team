class Game < ApplicationRecord

   


    belongs_to :team
    belongs_to :user
    has_many :comments


    validates :title, :start_time, :end_time,:place,:content, presence: true


    def self.search(search)
        if search != ""
          Game.where('title LIKE(?)', "%#{search}%")
        else
          Game.all
        end
    end

end
