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

| Column            | Type   | Options                 |
| ----------------- | ------ | ----------------------- |
| nickname          | string | null: false             |
| email             | string | null: false,unique: true|
| encrypted_password| string | null: false             |
| last_name         | string | null: false             |
| first_name        | string | null: false             |
| last_name _kana   | string | null: false             |
| first_name _kana  | string | null: false             |
| birthday          | date   | null: false             |




### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column     | Type      | Options          |
| ---------- | --------- | ---------------- |
| name       | string    | null: false      |
| explain    | text      | null: false      |
| category   | string    | null: false      |
| state      | string    | null: false      |
| cost       | string    | null: false      |
| location   | string    | null: false      |
| days       | string    | null: false      |
| price      | integer   | null: false      |
| user       | references| foreign_key: true|


### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |
| user       | references| foreign_key: true |
| item       | references| foreign_key: true |



### Association
- belongs_to :user
- belongs_to :item

## addressテーブル

| Column          | Type      | Options          |
| --------------- | --------- | ---------------- |
| postal-code     | string    | null: false      |
| prefecture      | string    | null: false      |
| city            | string    | null: false      |
| addresses       | string    | null: false      |
| building        | string    |                  |
| phone_number    | string    | null: false      |
| purchase        | references| foreign_key: true|




### Association
- belongs_to :purchase

