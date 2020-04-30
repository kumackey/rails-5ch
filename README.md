# README

http://18.179.20.78/

## 基本的な情報

```
$ ruby -v
ruby 2.6.5

$ rails -v
Rails 6.0.2.2

$ nginx -v
nginx version: nginx/1.12.2

$ mysql --version
mysql  Ver 14.14 Distrib 5.7.29, for Linux (x86_64) using  EditLine wrapper

$ yarn -v
1.22.4
```

## インフラ

VPC / EC2

## 開発環境の確認方法

```
$ docker-compose build
$ docker-compose rub web db:create db:migrate db:seed
$ docker-compose up
```

## 工夫した部分

- userID生成機能
- form objectによるvalidation(UIも含め)
- 検索機能
- テストを堅牢に(50以上)

## 改善点

- 要件を勘違いしていて、ユーザ情報・カテゴリ機能は要件と異なってしまっています(致命的なミスで申し訳ないです)。
- かなり迷いましたが、user情報はthresテーブル、repliesテーブルから分離した方が良かったと思われます。あるいはポリモーフィック関連。
- 勢い機能、sage機能など、他にも付けられそうな機能はたくさんありましたが、私のスピードが足りなかったです。

