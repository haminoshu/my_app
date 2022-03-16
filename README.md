# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_ruby     | string  | null: false              |
| first_name_ruby    | string  | null: false              |

### Association
- has_many :avatars
- has_many :comments

## avatars テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| age        | integer    | null: false                    |
| hobby      | text       | null: false                    |
| motto      | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false,                   |
| user        | references | null: false, foreign_key: true |
| avatar      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :avatar