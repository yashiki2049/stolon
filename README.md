# README

# 今後の改善箇所
##写真を複数枚投稿できるようにする
##コメント機能の実装
##検索機能の実装
##マイページ機能の実装

# 開発環境
##Ruby 2.6.5
##Rails 6.0.0
##HTML/CSS
##Javascript
##MySQL
##AWS
##VScode

# Stolonテーブル設計

## users テーブル (ユーザー管理)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| prefecture_id      | integer |             |
| text               | text    | null: false |

### Association

- has_many :photos
- belongs_to :prefecture

## photos テーブル （投稿写真を管理）

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| text               | text       | null: false |

### Association

- belongs_to :user
- has_many :photo_tags
- has_many :tags

## tags テーブル (タグを管理)

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| tag_name           | string     | null: false |

### Association

- has_many :photo_tags
- has_many :photos

## post_tags テーブル (タグと投稿の関連付けを管理)

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| photo              | references | null: false, foreign_key: tru |
| tag                | references | null: false, foreign_key: tru |

### Association

  belongs_to :photo
  belongs_to :tag