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







#　アプリケーション名　  

    MY TEAM


# アプリケーションの概要  


  社会人サッカーチームの運営アプリ
  チーム単位でアプリを使用知ることができる。


# URL


# テスト用アカウント  


  Basic認証パスワード :2222
  Basic認証ID       :admin



#　利用方法　　


  ##　チーム作成
    1. ヘッダーからユーザー新規登録を行う。
    2. チーム作成ボタンからチーム内容を入力し、チームを作成する。
      チームの作成者がチームオーナーとなる。
    3. チーム作成されるとトップページに表示される。


  ## チームへの参加
    1. トップページのチーム一覧画面より参加したいチームへ参加申請を送ることができる。
    2. チームオーナーが参加申請に対して承認することでチームに参加することができる。(チームオーナーは否認をすることもできる)


  ##　　スケジュールの作成、共有
    1. チームオーナーはスケジュール作成画面よりスケジュールを作成することができる。
    2. 登録されたスケジュールはスケジュールはスケジュールはカレンダー上にタイトルが表示される。
    3. スケジュール内容に関してはチームに参加しているユーザーのみ閲覧することができる。


  ## 練習試合募集
  　1. ヘッダーの練習試合募集作成より必要事項を入力し募集することができる。
  　2. 募集すると練習試合募集一覧に表示される。
  　3. ユーザーは募集内容に対してコメントをすることができる。


# アプリケーションを作成した背景  

  私も社会人サッカーチームの代表を努めたこともありチームを運営する上での課題をアプリで解決したいと思い作成をしました。

  ## 社会人サッカーチーム運営の課題
  1. チーム全体に情報共有されない       →  スケジュール機能(実装済み)
  2. 他チームのとの交流する機会が少ない  →  練習試合募集機能(実装済み)
  3. 参加人数不足                    →  スケット募集機能(実装前)
  4. データの管理ができない            →  試合データ管理機能(実装前)


  上記の課題を解決する機能を実装または実装予定です。


# 洗い出した要件　  
　


#　実装した機能についての画像やGIFおよびその説明


# 実装予定の機能  


# データベース設計


# 画面遷移図  


# 開発環境  


# ローカルでの動作方法


# 工夫したポイント



