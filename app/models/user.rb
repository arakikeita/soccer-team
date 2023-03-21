class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_teams, class_name: "Team", dependent: :destroy
  has_many :teams, through: :user_teams, dependent: :destroy
  has_many :user_teams, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :calenders, dependent: :destroy
  has_many :attends, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position

  

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX } ,on: :create
  
  
  

 

  with_options presence: true do
    validates :nickname, 
    validates :surname, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :surnamek, format: { with: /\A[ァ-ヶ一ー]+\z/, message: '全角カナを使用してください' }
    validates :namek, format: { with: /\A[ァ-ヶ一ー]+\z/, message: '全角カナを使用してください' }
    validates :birthday
    validates :play
    validates :position_id , numericality: { other_than: 1 ,message: "can't be blank"}
  end

 

end




















with_options presence: true , numericality: { other_than: 1 ,message: "can't be blank"} do 
  validates :category_id 
  validates :state_id
  validates :shipping_id
  validates :area_id
  validates :scheduled_day_id
end

with_options presence: true do 
  validates :post,format:{ with: /\A\d{3}[-]\d{4}\z/ }
  validates :area_id,numericality: {other_than: 1, message: "can't be blank"}
  validates :city
  validates :num
  validates :telephone,format:{ with: /\A\d{10,11}\z/ }
  validates :user_id
  validates :item_id
  validates :token

end