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

### Association
has_many :products 
has_many :wallets

## destinationsテーブル
| Column            |  Type  |  Options   |
| ----------------- | ------ | ---------- |
| post_code         | string | null:false | 
| prefecture_id     | integer | null:false | 
| city              | string | null:false | 
| address           | string | null:false |
| building_name     | string |            |
| phone_number      | string | null:false |
| wallet            | references | foreign_key: true | 

### Association
belongs_to :wallet 


## walletsテーブル
| Column            |  Type  |  Options   |
| ----------------- | ------ | ---------- |
| user              | references | null: false, foreign_key: true |
| product           | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :product
has_one :destination


## itemsテーブル
| Column            | Type   |  Options   |
| ----------------- | ------ | ---------- |
| name              | string | null:false |
| user              | references | null: false, foreign_key: true |
| price             | integer | null:false |
| description       | text   | null:false | 
| status_id         | integer | null:false |
| category_id       | integer | null:false |
| shipping_charge_id | integer | null:false | 
| shipping_day_id  | integer | null:false |  
| prefecture_id     | integer | null:false | 

### Association
belongs_to :user
has_one :wallet


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
