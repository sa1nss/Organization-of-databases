mysql> use lab
Database changed
mysql> SELECT region, SUM(population) AS total_population FROM cities GROUP BY region;
+--------+------------------+
| region | total_population |
+--------+------------------+
| N      |          3762446 |
| E      |          5754782 |
| S      |          4177039 |
| C      |          2086035 |
| W      |          2862051 |
+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT region, SUM(population) AS total_population FROM cities GROUP BY region HAVING COUNT(id) >= 10;
+--------+------------------+
| region | total_population |
+--------+------------------+
| E      |          5754782 |
| S      |          4177039 |
| W      |          2862051 |
+--------+------------------+
3 rows in set (0.00 sec)

mysql> SELECT name, populationFROM citiesWHERE region IN (SELECT uuid FROM regions WHERE area_quantity >= 5)ORDER BY population DESCLIMIT 10 OFFSET 10;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'region IN (SELECT uuid FROM regions WHERE area_quantity >= 5)ORDER BY population' at line 1
mysql> SELECT name, population FROM cities WHERE region IN (SELECT uuid FROM regions WHERE area_quantity >= 5) ORDER BY population DESC LIMIT 10 OFFSET 10;
ERROR 1146 (42S02): Table 'lab.regions' doesn't exist
mysql> SELECT name, population FROM cities WHERE region IN (SELECT uuid FROM regions WHERE area_quantity >= 5) ORDER BY population DESC LIMIT 10 OFFSET 10;
ERROR 1146 (42S02): Table 'lab.regions' doesn't exist
mysql> DROP TABLE IF EXISTS `regions`;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> CREATE TABLE `regions` (
    ->   `uuid` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
    ->   `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    ->   `area_quantity` int(10) unsigned NOT NULL,
    ->   PRIMARY KEY (`uuid`)
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
Query OK, 0 rows affected, 5 warnings (0.01 sec)

mysql> 
mysql> INSERT INTO `regions` (`uuid`, `name`, `area_quantity`) VALUES
    -> ('C','Center',5),
    -> ('E','East',3),
    -> ('N','Nord',4),
    -> ('S','South',5),
    -> ('W','West',8);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT name, population FROM cities WHERE region IN (SELECT uuid FROM regions WHERE area_quantity >= 5) ORDER BY population DESC LIMIT 10 OFFSET 10;
+---------------------------------+------------+
| name                            | population |
+---------------------------------+------------+
| Черкаси                         |     284459 |
| Хмельницький                    |     267891 |
| Чернівці                        |     264427 |
| Рівне                           |     249477 |
| Кам'янське                      |     240477 |
| Кропивницький                   |     232052 |
| Івано-Франківськ                |     229447 |
| Кременчук                       |     224997 |
| Тернопіль                       |     217950 |
| Луцьк                           |     217082 |
+---------------------------------+------------+
10 rows in set (0.00 sec)

mysql> SELECT region, SUM(population) AS total_population FROM cities WHERE population > 300000 GROUP BY region;
+--------+------------------+
| region | total_population |
+--------+------------------+
| N      |          2888470 |
| E      |          3901276 |
| S      |          3354900 |
| C      |           984423 |
| W      |          1100977 |
+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT name, population FROM cities WHERE region IN (SELECT uuid FROM regions WHERE area_quantity <= 5) AND (population < 150000 OR population > 500000);
+----------------------------+------------+
| name                       | population |
+----------------------------+------------+
| Київ                       |    2888470 |
| Харків                     |    1444540 |
| Одеса                      |    1010000 |
| Дніпро                     |     984423 |
| Донецьк                    |     932562 |
| Запоріжжя                  |     758011 |
| Кривий Ріг                 |     646748 |
| Керч                       |     147668 |
| Сєвєродонецьк              |     130000 |
| Хрустальний                |     124000 |
| Нікополь                   |     119627 |
| Бердянськ                  |     115476 |
| Слов'янськ                 |     115421 |
| Алчевськ                   |     111360 |
| Павлоград                  |     110144 |
| Євпаторія                  |     106115 |
| Лисичанськ                 |     103459 |
| Бровари                    |     100374 |
| Кадіївка                   |      92132 |
| Конотоп                    |      92000 |
+----------------------------+------------+
20 rows in set (0.00 sec)

mysql> notee
