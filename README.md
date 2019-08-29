# README

## Infomus
画像付きで情報を発信できる、情報共有サイトです。転職活動用のポートフォリオとして作成致しました。

## 機能一覧、使用gemなど
* ユーザー登録（確認メール送信）、ログイン機能、パスワード再発行メールなど（device）
* ユーザープロフィール画像アップロード、削除機能（active storage）
* ajaxを活用したユーザー間でのフォロー、フォロワー機能
* ツイート投稿機能(CRUD)
* ツイート画像投稿機能(active storage)　　改善したい
* ajaxを活用したいいね機能
* ツイートへのコメント機能
* ツイート一覧表示の際などのページネーション機能(kaminari)
* 人気ツイートランキング機能
* 管理者用名前空間での論理削除機能（kakurenbo-puti）ActiveAdmin使うべき？
* 名前、ツイートの検索機能(and検索)
* フォローしたユーザーのツイートのみを取得するタイムライン機能

## 使用技術
* Ruby 2.6.3
* Ruby on Rails 5.2.3
* MYSQL 8
* SASS,Bootstrap
* Docker
* GitHub,Git

## 開発環境
MacのDocker環境で開発。dockerfileとdocker-composeを使用して環境を作成しています。
GitHubは実際に使用することを想定して、開発用にfeatureブランチを作成して作業を行い、masterブランチにマージしました。

## テスト
* Rspec
  * 単体テスト（モデル）

## 環境構築方法
.envファイルに以下の内容を記述します

```
DATABASE_ROOT_PASSWORD= 'hogehoge'
DATABASE_USER="root"
DATABASE_HOST= 'db'

GMAIL_PASSWORD= **** 
GMAIL_ADDRESS= ****
```

GMAIL_PASSWORDとGMAIL_ADDRESSは自身のものをご使用ください。

開発環境用のseedを読み込んでいただくと、mailhog(localhost:8025/)にメールが届きます。
すべて認証していただくと、かんたんログインが可能となります。

管理者の機能を使用したい場合
ログイン画面に
メールアドレス　aiueo@ho.ge
パスワード　hogehoge
と打ち込んでいただけると、管理者としてログインが可能です。
通常ユーザーと違い、サイドバーの一番下に管理者機能が追加されます。
...
