<img src="https://img.shields.io/github/issues/takumi-murakami/AllEventList-app">  <img src="https://img.shields.io/github/forks/takumi-murakami/AllEventList-app">  <img src="https://img.shields.io/github/stars/takumi-murakami/AllEventList-app">


<a href="http://52.193.178.253/"><img src="https://user-images.githubusercontent.com/72126639/98492068-19415a80-227a-11eb-8145-ff3575b3ee82.png" height="200px;" /></a>
<br>
予定(カレンダー)シェア専用アプリケーション / Schedule share dedicated application


<hr>

## &#x1f58a; Description

__経緯__  
「チームで何かをするにあたって最も重要なツールは何か。」<br>
私個人としては、スケジュールの管理であると思いました。<br>
なぜならスケジュール管理はやるべきことを明確化し、効率の良い業務を期待できるからです。<br>
またそれをメンバー全員が同じカレンダーで管理することにより、タスク漏れ等のリスクヘッジにも繋がります。<br>
本アプリケーションは従来の予定シェア専用アプリケーションにはない機能も加えて、シンプルなデザインで設計しました。
<br>

__前提__  
本アプリケーションは、ユーザーが直感的に扱えるアプリケーションを目指した為、  一つのサーバーに対して、一つの団体が利用することを想定して開発しました。
<br>

__内容__  
(1)新規で予定を作成すると、トップページのカレンダーに追加されていくようになっています。サーバーに接続且つ、認証キーを知っているメンバー全員が確認できます。  

(2)また作成した予定には、詳細確認、編集、削除、コメント、検索のそれぞれのアクションに対応しており、コメントがされた場合、トップページにてユーザーに知らせます。  

(3)それぞれのマイページでは投稿した予定を一覧で取得し、必要であれば住所検索ができるようになっています。  

(4)全ての予定を、excel形式で出力する事も可能となっています。  


<br>

<details><summary>機能別一覧</summary><div>
  
* 予定の新規作成  
* 予定の詳細確認  
* 予定の編集・削除  
* コメント  
* 住所検索  
* マイページ
* コメント通知  
* 帳票出力
* 予定の検索

</div></details>

<hr>

## 🌐 App URL
<http://52.193.178.253/>

<details><summary>ユーザー認証あり</summary><div>

id: murakamidemo  
pass: murakami

</div></details>

<details><summary>テスト用ログインアカウント</summary><div>

email: test@mail.com  
pass: test1234

</div></details>
<br>
※1 ブラウザは最新のGoogle Chromeでの操作を推奨します。<br>
※2 レスポンシブWEBデザインに対応していますが、PC環境での操作を推奨します。　
<hr>

## 💻 Demo

  <img src="https://i.gyazo.com/40584bf7ddf948b1e7e94cab09cbc2a4.gif" height="400px;" />

<br>

<p align="center">
 👔MyPage / 📎Output / 🛎Notifications
</p>

<p align="center">
<img src="https://i.gyazo.com/ea44e602cbab8b211fa7a3df95b1b21b.jpg" height="150px;" >  <img src="https://i.gyazo.com/c5c9389d2e9f434d35a0a4c412eda777.gif"  height="150px;" >  <img src="https://i.gyazo.com/191a57eed7d221e222e7c6da449d67b5.png"  height="150px;" >
</p>

<hr>

## 📖 Requirement

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

## 📄 Database design

<img src="https://i.gyazo.com/a4772963e265a1641ce3bc2866f0ddbc.png" height="450px;" />

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
| address    | string     | null: false |
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

