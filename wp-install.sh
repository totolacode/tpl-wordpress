#!/bin/bash

# WordPressセットアップ admin_user,admin_passwordは管理画面のログインID,PW
wp core install \
--url='http://localhost:8080' \
--title=${WORDPRESS_SITE_NAME} \
--admin_user=${WORDPRESS_ADMIN_USER} \
--admin_password=${WORDPRESS_ADMIN_PASSWD} \
--admin_email=${WORDPRESS_ADMIN_EMAIL} \
--allow-root

# 日本語化
wp language core install ja --activate --allow-root

# タイムゾーンと日時表記
wp option update timezone_string 'Asia/Tokyo' --allow-root
wp option update date_format 'Y-m-d' --allow-root
wp option update time_format 'H:i' --allow-root

# キャッチフレーズの設定 (空にする)
wp option update blogdescription '' --allow-root

# プラグインの削除 (不要な初期プラグインを削除)
wp plugin delete hello.php --allow-root
wp plugin delete akismet --allow-root

# プラグインのインストール (必要に応じてコメントアウトを外す)d
wp plugin install all-in-one-wp-migration --activate --allow-root
wp plugin install wp-multibyte-patch --activate --allow-root
# wp plugin install backwpup --activate --allow-root
# wp plugin install siteguard --activate --allow-root
# wp plugin install advanced-custom-fields --activate --allow-root
# wp plugin install contact-form-7 --activate --allow-root
# wp plugin install all-in-one-seo-pack --activate --allow-root
# wp plugin install ewww-image-optimizer --activate --allow-root

# テーマの削除
wp theme delete twentysixteen --allow-root
wp theme delete twentyseventeen --allow-root
wp theme delete twentynineteen --allow-root
wp theme delete twentytwenty --allow-root
wp theme delete twentytwentyone --allow-root
wp theme delete twentytwentytwo --allow-root

# テーマ名変更
# mv /var/www/html/wp-content/themes/${WORDPRESS_THEME_NAME} /var/www/html/wp-content/themes/${WORDPRESS_THEME_NAME}

# テーマ有効化
# wp theme activate $WORDPRESS_THEME_NAME --allow-root

# パーマリンク更新
# wp option update permalink_structure /%postname%/ --allow-root