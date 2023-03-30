class Game < ApplicationRecord

   

    has_one_attached :image
    belongs_to :team
    belongs_to :user
    has_many :comments,dependent: :destroy

    with_options presence: true do
        validates :title
        validates :place
        validates :content
    end

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area


    def self.search(search)
        if search != ""
          Game.joins(:team).where('title LIKE(?) OR place LIKE(?) OR start_time LIKE(?) OR team_name LIKE(?) ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
        else
          Game.all
        end
    end

end
