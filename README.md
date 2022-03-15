# README

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many   :tasks
- has_many   :lists
- has_many   :memos
- has_many   :calendar_memos
- has_many   :informations
- has_many   :storehouses


## tasks テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| task                  | string     | null: false                    |
| deadline              | date       | null: false                    |
| responsible_person_id | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to  :responsible_person
- belongs_to  :status
- belongs_to  :user


## lists テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| list               | string     | null: false                    |
| importance_id      | integer    | null: false                    |
| list_genre_id      | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to  :importance
- belongs_to  :list_genre
- belongs_to  :status
- belongs_to  :user


## memos テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| memo               | text       | null: false                    |
| status_id          | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to  :status
- belongs_to  :user


## calendar_memos テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| date_text          | date       | null: false                    |
| schedule           | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to  :user


## informations デーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| info               | string     | null: false                    |
| info_memo          | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to  :user


## storehouses テーブル（保管庫）

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| file_name          | string     | null: false                    |
| file_genre         | integer    |                                |
| file_memo          | string     |                                |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to  :list_genre
- belongs_to  :user