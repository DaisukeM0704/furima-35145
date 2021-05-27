## users テーブル

| Column            | Type   | Options     |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| re_enter_password | string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birthday          | string | null: false |

### Association
- has_many :items
- has_many :comments
- has_one :shipping_address
- has_one :credit_cards

## items テーブル

| Column             | Type       | Options           |
| name               | string     | null: false       |
| introduction       | text       | null: false       |
| price              | integer    | null: false       |
| category           | string     | null: false       |
| condition          | string     | null: false       |
| cost               | string     | null: false       |
| ship_from_location | string     | null: false       |
| delivery_time      | string     | null: false       |
| user               | references | foreign_key: true |

### Association
- belongs_to :users
- belongs_to :shipping_address
- has_many :comments

## shipping_address テーブル

| Column       | Type       | Options           |
| postal_cord  | string     | null: false       |
| prefectures  | string     | null: false       |
| municipality | string     | null: false       |
| house_number | string     | null: false       |
| building_na  | string     |                   |
| cost         | string     | null: false       |
| phone_number | string     | null: false       |
| user         | references | foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items

## credit_cards テーブル

| Column          | Type       | Options           |
| card_number     | string     | null: false       |
| expiration_date | string     | null: false       |
| security_cord   | string     | null: false       |
| user            | references | foreign_key: true |

### Association
- belongs_to :users

## comments テーブル

| text | text       | null: false       |
| user | references | foreign_key: true |
| item | references | foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
