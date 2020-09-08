# README

## user テーブル

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
| birthday       | date               | null: false |

### Association

- has_many :items
- has_many :transaction
- has_one :address



## item テーブル

| Column            | Type    | Options     |
| ------------------| --------| ----------- |
| name              | string  | null: false |
| price             | integer | null: false |
| text              | string  | null: false |
| image             | text    | null: false |
| category_id       | integer | null: false | 
| product_status_id | integer | null: false |
| shipping_fee_id   | integer | null: false |
| prefectures_id    | integer | null: false |
| shipping_date_id  | integer | null: false |
| user_id           | integer | null: false |

### Association

- belongs_to :user
- has_one :transaction


## transaction テーブル
 
| Column  | Type        | Options                        |
| ------  | ------------|------------------------------- |
| user_id | integer     | null: false, foreign_key: true |
| item_id | integer     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column        | Type       | Options                         |
| --------------| -----------|---------------------------------|
| user_id       | integer    | null: false,  foreign_key: true |
| postal_code   | string     | null: false                        |                   
| prefecture    | integer    | null: false                        |
| city          | string     | null: false                        |
| house_number  | string     | null: false                        |
| building_name | string     |                                    |
| tel           | integer    |null: false                         |

### Association

- belongs_to :transaction
- belongs_to :user


