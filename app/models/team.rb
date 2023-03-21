class Team < ApplicationRecord

  has_many :user_teams,dependent: :destroy
  has_many :users, through: :user_teams,dependent: :destroy
  has_many :applies, dependent: :destroy
  has_one_attached :image
  has_many :calenders,dependent: :destroy
  belongs_to :user
  has_many :games,dependent: :destroy
  has_many :comments,dependent: :destroy

    # ユーザがコミュニティに所属していればtrueを返す
    def user_belonging?(user)
      users.include?(user)
    end



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  

  with_options presence: true do
    validates :team_name
    validates :name
    validates :introduction
    validates :area_id , numericality: { other_than: 1 ,message: "can't be blank"}
    validates :owner_id
  end

end
