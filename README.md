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

| Column     | Type        | Option         |
| ---------- | ---------   | -------------- |
| nickname   | string      | null: false    |
| email      | string      | null: false, unique:true | ユニーク制約
| encrypted_password  | string    | null: false    | 
| surname    | string      | null: false    |
| name       | string      | null: false    |
| surnamek   | string      | null: false    |
| namek      | string      | null: false    |
| birthday   | date        | null: false    |

### Association

- has_many :user_teams
- has_many :teams, through: :user_teams


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


### Association

- has_many :user_teams
- has_many :users, through: :user_teams
- has_many :calenders


## calenderテーブル

| Column       | Type        | Option         |
| ----------   | ---------   | -------------- |
| title        | string      | null: false    |
| content      | text        | null: false    |
| start_time   | datetime    | null: false    |    

### Association

- belongs_to :team


