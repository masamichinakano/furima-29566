# README

## users テーブル

| Column         | Type               | Options     |
| ---------------| -------------------|------------ |
| nickname       | string             | null: false |
| email          | string             | null: false |
| name           | string             | null: false |
| password       | encrypted_password | null: false |
| f_name         | string             | null: false |
| l_name         | string             | null: false |
| f_name_leader  | string             | null: false |
| l_name_leader  | string             | null: false |
| birthday_year  | integer            | null: false |
| birthday_month | integer            | null: false |
| birthday_day   | integer            | null: false |

### Association

- has_many :items
- has_many :comments



## items テーブル

| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| name           | string | null: false |
| price          | integer| null: false |
| text           | string | null: false |
| image          | text   | null: false |
| category       | string | null: false | 
| product_status | string | null: false |
| shipping_fee   | string | null: false |
| prefectures    | string | null: false |
| shipping_date  | string | null: false |

### Association

- belongs_to :user
- has_many :comments



## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :item