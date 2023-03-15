class Game < ApplicationRecord

   

    has_one_attached :image
    belongs_to :team
    belongs_to :user
    has_many :comments


    validates :title, :start_time, :end_time,:place,:content, presence: true

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area


    def self.search(search)
        if search != ""
          Game.where('title LIKE(?)', "%#{search}%")
        else
          Game.all
        end
    end

end
