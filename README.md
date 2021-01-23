# README# Stolonテーブル設計

## users テーブル (ユーザー管理)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| prefecture_id      | integer |             |
| gender             | string |             |
| text               | text    | null: false |

### Association

- has_many :records
- has_many :photos
- has_many :photo_likes
- has_many :record_likes

## photos テーブル （投稿写真を管理）

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| text               | text       | null: false |

### Association

- belongs_to :user
- has_one :photo_likes
- has_one :post_tags

## records テーブル (育成記録概要を管理)

| Column        | Type       | Options     |
| ------------- | ---------- | ----------  |
| title         | string     | null: false |
| genre_id      | integer    | null: false |
| text          | text       | null: false |
| start_date    | date       | null: false |

### Association

- belongs_to :user
- has_one :record_likes
- has_one :post_tags

## record_contents テーブル (育成記録を管理)

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| shoot_date         | date       | null: false |
| title              | string     | null: false |
| text               | text       | null: false |

### Association

- belongs_to :record

## tags テーブル (タグを管理)

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |

### Association

- belongs_to :post_tags

## post_tags テーブル (タグと投稿の関連付けを管理)

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| photo              | references | null: false, foreign_key: tru |
| record             | references | null: false, foreign_key: tru |

### Association

- belongs_to :photo
- belongs_to :record
- has_one :tags

## photo_likes テーブル (写真のいいねを管理)

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key: tru |
| photo              | references | null: false, foreign_key: tru |

### Association

- belongs_to :user
- belongs_to :photo

## record_likes テーブル (育成記録のいいねを管理)

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key: tru |
| record              | references | null: false, foreign_key: tru |

### Association

- belongs_to :user
- belongs_to :record