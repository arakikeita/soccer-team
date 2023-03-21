# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



#テーブル設計

## usersテーブル

| Column      | Type        | Option         |
| ----------  | ---------   | -------------- |
| nickname    | string      | null: false    |
| email       | string      | null: false, unique:true | ユニーク制約
| encrypted_password  | string    | null: false    | 
| surname     | string      | null: false    |
| name        | string      | null: false    |
| surnamek    | string      | null: false    |
| namek       | string      | null: false    |
| birthday    | date        | null: false    |
| position_id | integer     | null: false    |
| play        | string      | null: false    |



### Association

- has_many :user_teams, dependent: :destroy
- has_many :teams, through: :user_teams, dependent: :destroy
- has_many :owned_teams, class_name: "Team"
- has_many :games
- has_many :attends, dependent: :destroy
- has_many :applies
- has_many :calenders
- has_many :comments
- has_one_attached :image



## user_teamsテーブル 中間テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| team   | references | null: false, foreign_key: true |


### Association

- belong_to :teams
- belong_to :user


## teamsテーブル

| Column       | Type        | Option         |
| ----------   | ---------   | -------------- |
| team_name    | string      | null: false    |
| name         | string      | null: false    |
| introduction | string      | null: false    |    
| area_id      | integer     | null: false    |
| owner_id     | integer     | null: false    |
| user         | references  | null: false, foreign_key: true |

### Association

- has_many :user_teams,dependent: :destroy
- has_many :users, through: :user_teams,dependent: :destroy
- has_many :calenders,dependent: :destroy
- belongs_to :user
- has_many :games,dependent: :destroy
- has_many :applies,dependent: :destroy
- has_many :comments,dependent: :destroy
- has_one_attached :image



## appliesテーブル 

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| team   | references | null: false, foreign_key: true |


### Association

- belong_to :team
- belong_to :user




## attendsテーブル

| Column       | Type        | Option         |
| ----------   | ---------   | -------------- |  
| attend_id    | integer     | null: false    |
| calender     | references  | null: false, foreign_key: true |
| user         | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :calender




## calendersテーブル

| Column       | Type        | Option         |
| ----------   | ---------   | -------------- |
| title        | string      | null: false    |
| content      | text        | null: false    |
| start_time   | datetime    | null: false    |    
| user         | references  | null: false, foreign_key: true |
| team         | references  | null: false, foreign_key: true |

### Association

- belongs_to :team
- belongs_to :user
- has_many :attends,dependent: :destroy


## gamesテーブル

| Column       | Type        | Option         |
| ----------   | ---------   | -------------- |
| title        | string      | null: false    |
| start_time   | datetime    | null: false    |
| end_time     | datetime    | null: false    |
| place        | string      | null: false    |  
| content      | text        | null: false    |  
| user         | references  | null: false, foreign_key: true |
| team         | references  | null: false, foreign_key: true |

### Association

- belongs_to :team
- belongs_to :user
- has_many :comments


## commentsテーブル

| Column       | Type        | Option         |
| ----------   | ---------   | -------------- |
| content      | text        | null: false    |  
| user         | references  | null: false, foreign_key: true |
| team         | references  | null: false, foreign_key: true |
| game         | references  | null: false, foreign_key: true |

### Association

- belongs_to :team
- belongs_to :user
- belongs_to :game




