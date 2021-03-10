# README

## ◆アプリケーション「stolon」 

## 着想  
日本語で「ほふく茎」という意味。  
ほふく茎は、上に伸びず地上近くを這って伸びる茎のこと＝**園芸の交流の輪がほふく茎のように広がるようなイメージ**  
園芸が好きなので、**植物（花木・野菜）の写真投稿・交流に特化したアプリケーション**を作りたいと考え開発を開始  

## アプリケーションの目的   
・育てた植物の成長過程や育成記録を管理したい  
　**∟ユーザー管理機能**  
・普段から自宅で園芸や家庭菜園をしている人が、写真を投稿して交流したい  
　**∟写真投稿機能・コメント投稿機能**  
・他の人がどんな風に植物を育てたり、インテリアとして配置したりしているのか知りたい  
　**∟投稿タグ検索機能**  
 
## 現時点でのできること  
・ユーザー登録  
・コメント、タグを含む写真投稿  
 
## 今後の改善箇所  
1.写真を複数枚投稿できるようにする  
2.コメント機能の実装  
3.タグをクリックしての検索機能の実装  
4.マイページ機能の実装

## 開発環境  
Ruby 2.6.5  
Rails 6.0.0  
HTML/CSS  
Javascript  
MySQL  
AWS  
VScode

## Stolonテーブル設計

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
