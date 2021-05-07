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

## usersテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| name_kana  | string | null: false |
| birthday   | integer| null: false |




### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column     | Type      | Options          |
| ---------- | --------- | ---------------- |
| name       | string    | null: false      |
| image      | string    | null: false      |
| explain    | text      | null: false      |
| category   | string    | null: false      |
| state      | string    | null: false      |
| cost       | string    | null: false      |
| location   | string    | null: false      |
| days       | string    | null: false      |
| price      | integer   | null: false      |
| user_id    | references| foreign_key: true|


### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |
| user_id    | references| foreign_key: true |
| item_id    | references| foreign_key: true |



### Association
- belongs_to :user
- belongs_to :item

## addressテーブル

| Column          | Type      | Options          |
| --------------- | --------- | ---------------- |
| credit_card     | string    | null: false      |
| shipping_address| string    | null: false      |
| phone_number    | string    | null: false      |



### Association
- belongs_to :purchase

