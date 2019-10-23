# README

## Infomus
画像付きで情報を発信できる、情報共有サイトです。転職活動用のポートフォリオとして作成致しました。

## 本番環境
https://morooka3.net/
ログイン画面からテストユーザーでログインが可能です。
開発環境はdevelopブランチにあります。

## 機能一覧、使用gemなど
* ユーザー登録（確認メール送信）、ログイン機能、パスワード再発行メールなど（device）
* ユーザープロフィール画像アップロード、削除機能（active storage）
* ajaxを活用したユーザー間でのフォロー、フォロワー機能
* ツイート投稿機能(CRUD)
* ツイート画像投稿機能(carrierwave)
* ajaxを活用したいいね機能
* ツイートへのコメント機能
* ツイート一覧表示の際などのページネーション機能(kaminari)
* 人気ツイートランキング機能
* 管理者用名前空間での論理削除機能（kakurenbo-puti）
* 名前、ツイートの検索機能(and検索)
* フォローしたユーザーのツイートのみを取得するタイムライン機能
* レスポンシブデザイン（スマホサイズに対応）

## 使用技術
* Ruby 2.6.3
* Ruby on Rails 5.2.3
* MYSQL 8
* SASS,Bootstrap
* Docker
* GitHub,Git
* Rspec
* terraform
* AWS
  * VPC
  * EC2
  * ECS
  * ECR 
  * RDS for MySQL 
  * ALB
  * Route53
  * S3
  * ACM
* circleci

## テスト
* Rspec
  * 単体テスト（モデル）
  * 統合テスト（systemspec）

## circleci
masterブランチへプッシュ
circleciで自動ビルド・自動テスト・自動デプロイ、タスク定義の更新とmigrationを行う

# AWSアーキテクチャ図
...
