# tpl-wordpress

WordPressを入れたWebサイトを構築するためのローカル開発環境のひな形です。

## 設定ファイルの修正
1. `.env.example`と`docker-compose.yml.example`をそれぞれ`.env`と`docker-compose.yml`にリネームしてください
2. `.env`と`docker-compose.yml`と`Dockerfile`と`wp-install.sh`の内容をそれぞれ構築する内容に沿って修正してください。

## Build Setup

``` bash
# イメージの作成、コンテナの作成・起動
$ docker-compose up -d

# wordpressのコンテナに入る
$ docker exec -it container-name sh

# シェルスクリプトファイルの権限を変更
$ chmod +x /tmp/wp-install.sh

# シェルスクリプトの実行
$ /tmp/wp-install.sh

# プラグインのインストールやアップデートができるようにする
$ chown -R www-data:www-data *

# コンテナから出る  
$ exit

# 2回目以降の起動 -d: バックグランドでの起動
$ docker-compose up -d

# 終了
$ docker-compose down

# ボリュームを削除して終了
$ docker-compose down -v

# ネットワーク、ボリューム、イメージを削除して終了
$ docker-compose down -v --rmi all
```


ファイルを修正した場合は以下のどちらかで再構築してください。
``` bash
$ docker-compose build
$ docker-compose up --build
```

無事完了したらログイン画面を確認します。<br>
http://localhost:8080/wp-login.php`