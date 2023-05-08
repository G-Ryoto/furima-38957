# README　テーブル設計

## usersテーブル
| Column            |  Type  |  Options   |
| ----------------- | ------ | ---------- |
| first_name        | string | null:false |
| family_name       | string | null:false |
| family_name_kana  | string | null:false |
| first_name_kana   | string | null:false |
| email             | string | null:false,unique: true |
| nickname          | string | null:false |
| encrypted_password | string | null:false |
| birth_day         | date   | null:false |
has_many :products dependent: :destroy

## destinationsテーブル
| Column            |  Type  |  Options   |
| ----------------- | ------ | ---------- |
| user_id           | integer | null:false |
| post_code         | string | null:false | 
| prefecture        | string | null:false | 
| city              | string | null:false | 
| address           | string | null:false |
| building_name     | string |            |
| phone_number      | string |            |  
belongs_to :wallet 


## walletsテーブル
| Column            |  Type  |  Options   |
| ----------------- | ------ | ---------- |
| user              | references | null: false, foreign_key: true |
| product           | references | null: false, foreign_key: true |
belongs_to :user
belongs_to :product


## productsテーブル
| Column            | Type   |  Options   |
| ----------------- | ------ | ---------- |
| name              | string | null:false |
| price             | integer | null:false |
| description       | text   | null:false | 
| status            | string | null:false |
| size              | string | null:false | 
| category          | string | null:false |
| shipping_charge_id | integer | null:false | 
| shipping_days_id  | integer | null:false |  
belongs_to :user dependent: :destroy


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
