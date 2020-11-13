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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| detail             | text       | null: false                    |
| address            | string     | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## purchase_recodes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

## shipping_address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_num        | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| banch           | string     | null: false                    |
| phone_num       | string     | null: false                    |
| building_name   | string     |                                |
| purchase_recode | references | null: false, foreign_key: true |

### Association

## users テーブル
has_many : items
has_many : purchase_recodes

## items テーブル

belongs_to : user
belongs_to : category
belongs_to : status
belongs_to : shipping_charge
belongs_to : shipping_prefecture
belongs_to : shipping_date
has_one : purchase_recode

## categories テーブル
has_many : items

## status テーブル
has_many : items

## shipping_charges
has_many : items

## shipping_prefectures
has_many : items
has_many : shipping_address

## shipping_dates
has_many : items

## purchase_recodes テーブル

belongs_to : user
belongs_to : item
has_one : shipping_address

## shipping_address テーブル

belongs_to : purchase_recode
belongs_to : shipping_prefecture