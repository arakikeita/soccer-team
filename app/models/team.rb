class Team < ApplicationRecord

  has_many :user_teams
  has_many :users, through: :user_teams,dependent: :destroy
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  validates :area_id, numericality: { other_than: 1}
  validates :team_name, :name, :introduction,:owner_id, presence: true

end
