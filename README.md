# README# Stolonテーブル設計

## users テーブル (ユーザー管理)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| prefecture_id      | integer |             |
| gender_id          | integer |             |
| text               | text    | null: false |

### Association

- has_many :diaries
- has_many :photos
- has_many :photo_likes
- has_many :diary_likes

## photos テーブル （投稿写真を管理）

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| text               | text       | null: false |
| media_id           | integer    | null: false |

### Association

- belongs_to :user
- has_one :photo_likes
- has_one :post_tags

## diaries テーブル (育成記録概要を管理)

| Column        | Type       | Options     |
| ------------- | ---------- | ----------  |
| title         | string     | null: false |
| genre_id      | integer    | null: false |
| text          | text       | null: false |
| start_date    | date       | null: false |

### Association

- belongs_to :user
- has_one :diary_likes
- has_one :post_tags

## diary_contents テーブル (育成記録を管理)

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| shoot_date         | date       | null: false |
| title              | string     | null: false |
| text               | text       | null: false |

### Association

- belongs_to :diary

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
| diary              | references | null: false, foreign_key: tru |

### Association

- belongs_to :photo
- belongs_to :diary
- has_one :tags

## photo_likes テーブル (写真のいいねを管理)

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key: tru |
| photo              | references | null: false, foreign_key: tru |

### Association

- belongs_to :user
- belongs_to :photo

## diary_likes テーブル (育成記録のいいねを管理)

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key: tru |
| diary              | references | null: false, foreign_key: tru |

### Association

- belongs_to :user
- belongs_to :diary