# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.5.1

* Rails version
5.0.7.2

* Database creation

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|email|string|null:false|

※ password, password_confirmation は、deviseで管理

### Association
- has_many :posts


## postsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|user_id|integer|null:false, foreign_key: true|

### Association
- belongs_to :user



