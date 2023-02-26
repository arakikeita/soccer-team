class Team < ApplicationRecord

  has_many :user_teams
  has_many :users, through: :user_teams

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  validates :area_id, numericality: { other_than: 1}
  validates :team_name, :name, presence: true

end
