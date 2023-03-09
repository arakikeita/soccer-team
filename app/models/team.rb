class Team < ApplicationRecord

  has_many :user_teams,dependent: :destroy
  has_many :users, through: :user_teams,dependent: :destroy
  has_many :applies, dependent: :destroy
  has_one_attached :image
  has_many :calenders
  belongs_to :user

    # ユーザがコミュニティに所属していればtrueを返す
    def user_belonging?(user)
      users.include?(user)
    end



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  validates :area_id, numericality: { other_than: 1}
  validates :team_name, :name, :introduction,:owner_id, presence: true

end
