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
- has_many   :orders

## items テーブル

| Column           | Type       | Options           |
| name             | string     | null: false       |
| introduction     | text       | null: false       |
| price            | integer    | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| cost_id          | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| delivery_time_id | integer    | null: false       |
| user             | references | foreign_key: true |

### Association
- has_one    :order
- has_many   :comments
- belongs_to :user

## address テーブル

| Column        | Type       | Options           |
| postal_cord   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| house_number  | string     | null: false       |
| building_name | string     |                   |
| phone_number  | string     | null: false       |
| order         | references | foreign_key: true |

### Association
- belongs_to :order

## orders テーブル

| Column | Type       | Options           |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item

## comments テーブル

| text | text       | null: false       |
| user | references | foreign_key: true |
| item | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
