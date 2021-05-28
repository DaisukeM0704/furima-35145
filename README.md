## users テーブル

| Column             | Type   | Options                   |
| nickname           | string | null: false               |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many   :items
- has_many   :comments
- belongs_to :purchase_management
- belongs_to :shipping_address

## items テーブル

| Column           | Type       | Options           |
| name             | string     | null: false       |
| introduction     | text       | null: false       |
| price            | integer    | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| cost_id          | integer    | null: false       |
| prefectures_id   | integer    | null: false       |
| delivery_time_id | integer    | null: false       |
| user             | references | foreign_key: true |

### Association
- has_one    :shipping_address
- has_many   :comments
- belongs_to :users
- belongs_to :purchase_management

## shipping_address テーブル

| Column         | Type       | Options           |
| postal_cord    | string     | null: false       |
| prefectures_id | integer    | null: false       |
| municipality   | string     | null: false       |
| house_number   | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| user           | references | foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items

## purchase_management テーブル

| Column | Type       | Options           |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
- has_many :users
- has_many :items

## comments テーブル

| text | text       | null: false       |
| user | references | foreign_key: true |
| item | references | foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
