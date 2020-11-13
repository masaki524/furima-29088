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

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| birthday | date   | null: false |

## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| image     | image      | null: false                    |
| item_name | string     | null: false                    |
| text      | text       | null: false                    |
| detail    | text       | null: false                    |
| address   | string     | null: false                    |
| price     | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

## purchase_recodes テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| credit_num      | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_num    | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| items           | references | null: false, foreign_key: true |

## shipping_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_num      | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| banch         | string     | null: false                    |
| phone_num     | string     | null: false                    |
| building_name | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

## users テーブル
has_many : items
has_many : purchase_recodes
has_many : shipping_address

## items テーブル

belongs_to : users
has_one : purchase_recodes
has_one : shipping_address

## purchase_recodes テーブル

belongs_to : users
belongs_to : items
has_one : shipping_address

## shipping_address テーブル

belongs_to : users
belongs_to : items
belongs_to : purchase_recodes 