<h1>Docker среда для Moodle</h1>
Это масштабируемая Docker среда, предназначенная для запуска любой версии Moodle. Она упрощает процесс развертывания и установки Moodle, обеспечивая гибкую и доступную среду для разработки и тестирования.

<h2>Инструкция по установке</h2>

1. Распакуйте версию Moodle в корень папки "moodle".
2. Выполните команду docker-compose up -d для запуска Docker контейнеров.
3. Настройте Redis (без пароля) с параметрами: хост - redis:6379.
4. Перейдите по адресу http://localhost:80 для установки Moodle.

<h2>Настройка config.php</h2>
Добавьте следующий код в файл "config.php" настроек Moodle (расположен в папке "moodle"):

````php
<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'db';
$CFG->dbname    = 'mdl';
$CFG->dbuser    = 'root';
$CFG->dbpass    = 'txoWdNWIfS';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
    'dbpersist' => 0,
    'dbport' => 3306,
    'dbsocket' => '',
    'dbcollation' => 'utf8mb4_unicode_ci',
);

$CFG->wwwroot   = 'http://localhost';
$CFG->dataroot  = '/data/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 0777;
$CFG->slasharguments = false;
require_once(__DIR__ . '/lib/setup.php'); 
````

<h2>Запуск за обратным прокси на HTTPS</h2>
Если вы планируете запускать Moodle за обратным прокси на HTTPS, убедитесь, что настройки прокси соответствуют вашим требованиям. Внесите соответствующие изменения в файлы конфигурации Docker и Moodle.

<h2>Машстабирование</h2>
Основным контейнером, который обрабатывает запросы, является контейнер app. Создавая множество экземпляров этого контейнера вы сможете распределить нагрузку.
````shell
docker-compose up app -d --scale app=<N>
````
<h2>Лицензия</h2>
Этот проект распространяется под лицензией MIT. Вы можете свободно использовать, изменять и распространять код без ограничений.
