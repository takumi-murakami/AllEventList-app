<img src="https://img.shields.io/github/issues/takumi-murakami/AllEventList-app">  <img src="https://img.shields.io/github/forks/takumi-murakami/AllEventList-app">  <img src="https://img.shields.io/github/stars/takumi-murakami/AllEventList-app">

<p align="center">
<a href="http://52.193.178.253/"><img src="https://user-images.githubusercontent.com/72126639/98492068-19415a80-227a-11eb-8145-ff3575b3ee82.png" height="200px;" /></a>
<br>
予定(カレンダー)シェア専用アプリケーション / Schedule share dedicated application
</p>

<hr>

## &#x1f58a;Description

前提としてこのアプリケーションは、余分な機能を省き、より直感的に扱えるアプリケーションを目指した為、  一つのサーバーに対して、一つの団体が利用することを想定して開発されています。  
	
※余分な機能の定義としては、次のようなユーザーが直感的に操作する事ができない機能を仮定します。
1. room作成機能   
	
	
予定をシェアし、複数のユーザーが予定に対してコメントをしたり、特定のユーザーのマイページにて予定を確認する事ができます。  
<br>
<br>
As a premise, this application is developed assuming that one organization will use it for one server because it aims to be an application that can be handled more intuitively by omitting extra functions.  

* As the definition of extra functions, the following functions that cannot be operated intuitively by the user are assumed.  
1. room creation function  

You can share an appointment, multiple users can comment on the appointment, and you can check the appointment on My Page of a specific user.
<hr>

## 🌐App URL
<http://52.193.178.253/>

<details><summary>ユーザー認証</summary><div>

id: murakamidemo  
pass: murakami

</div></details>

<hr>

## 💻Demo
<p align="center">
  <img src="https://i.gyazo.com/40584bf7ddf948b1e7e94cab09cbc2a4.gif" height="400px;" />
</p>
<br>

<p align="center">
 👔MyPage / 📎Output / 🛎Notifications
</p>

<p align="center">
<img src="https://i.gyazo.com/ea44e602cbab8b211fa7a3df95b1b21b.jpg" height="150px;" >  <img src="https://i.gyazo.com/c5c9389d2e9f434d35a0a4c412eda777.gif"  height="150px;" >  <img src="https://i.gyazo.com/191a57eed7d221e222e7c6da449d67b5.png"  height="150px;" >
</p>

<hr>

## 📖Requirement

* Ruby 2.6.5
* RubyOnRails 5.2.4
* HTML
* CSS
* JavaScript

__RubyGems__
* <https://rubygems.org/gems/jquery-rails>
* <https://rubygems.org/gems/fullcalendar-rails>
* <https://rubygems.org/gems/momentjs-rails>
* <https://rubygems.org/gems/jbuilder>

<hr>

## 📄Database design

<p align="center">
  <img src="https://i.gyazo.com/a4772963e265a1641ce3bc2866f0ddbc.png" height="450px;" />
</p>
<br>

### users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |


- has_many :events
- has_many :comments
- has_many :notifications


### events テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| title      | string     | null: false |
| body       | string     | null: false |
| start_date | datetime   | null: false |
| end_date   | datetime   | null: false |
| user_id    | references | null: false |


- belongs_to :user
- has_many :comments
- has_many :notifications
- has_many :reports


### comments テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| text     | text       | null: false |
| user_id  | references | null: false |
| event_id | references | null: false |


- belongs_to :user
- belongs_to :event
- has_many :notifications


### notifications テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| visitor    | referendes | null: false |
| visited    | references | null: false |
| event_id   | references | null: false |
| comment_id | references | null: false |
| checked    | boolean    | null: false |


- belongs_to :user
- belongs_to :event


### reports テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |

- belongs_to :event

