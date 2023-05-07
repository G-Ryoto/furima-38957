# README　テーブル設計

## usersテーブル
| Column            |  Type  |  Options   |
| ----------------- | ------ | ---------- |
| first_name        | string | null:false |
| family_name       | string | null:false |
| family_name_kana  | string | null:false |
| first_name_kana   | string | null:false |
| emails            | string | null:false |
| nickname          | string | null:false |
| encrypted_password        | string | null:false |
| introduction      | text   |            |
| birth_day         | date   | null:false |
| user_image        | string |            |

## destinationテーブル
| Column            |  Type  |  Options   |
| ----------------- | ------ | ---------- |
| user_id           | integer | null:false,foreign_key:true |
| family_name       | string | null:false |
| first_name        | string | null:false |
| family_name_kana  | string | null:false |
| first_name_kana   | string | null:false |
| post_code         | string | null:false | 
| prefecture        | string | null:false | 
| city              | string | null:false | 
| address           | string | null:false |
| building_name     | string |            |
| phone_number      | string |            |  

## cardテーブル
| Column            |  Type  |  Options   |
| ----------------- | ------ | ---------- |
| user_id           | integer | null:false,foreign_key:true |
| customer_id       | string | null:false |
| card_id           | string | null:false |

## categoryテーブル
| Column            |  Type  |  Options   |
| ----------------- | ------ | ---------- |
| name              | string | null:false | 
| ancestry          | string |            | 

## productテーブル
| Column            | Type   |  Options   |
| ----------------- | ------ | ---------- |
| name              | string | null:false | 
| price             | string | null:false |
| description       | string | null:false | 
| status            | string | null:false |
| size              | string | null:false | 
| shipping_cost     | string | null:false |
| shipping_days     | string | null:false |
| prefecture_id     | string | null:false |
| judgment          | string |            | 
| category_id       | integer | null:false,foreign_key:true |
| brand_id          | integer | null:false,foreign_key:true |
| shipping_id       | integer | null:false,foreign_key:true |
| user_id           | integer | null:false,foreign_key:true |

## imageテーブル
| Column            | Type   |  Options   |
| ----------------- | ------ | ---------- |
| image             | string | null:false |
| product_id        | integer | null:false,foreign_key:true |

## brandテーブル
| Column            | Type   |  Options   |
| ----------------- | ------ | ---------- |
| name              | string | index:true |


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
