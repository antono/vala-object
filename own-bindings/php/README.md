# GObjects for PHP

You have to install [gobject-for-php](https://github.com/megous/gobject-for-php) and load the php gobject extension into your php.ini:

    printf "\n%s%s%s\n" "extension=" $(php-config --extension-dir) "/gobject.so" >> /etc/php5/cli/php.ini

Now you can run the script with

    ./run.sh test.php
