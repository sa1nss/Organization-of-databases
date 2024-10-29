mysql> use lab
Database changed
mysql> SELECT UPPER(name) AS city_name FROM cities WHERE region = 'U' ORDER BY name LIMIT 5 OFFSET 5;
Empty set (0.00 sec)

mysql> SELECT UPPER(name) AS city_name FROM cities WHERE region = 'U' ORDER BY name LIMIT 5 OFFSET 5;
Empty set (0.00 sec)

mysql> SELECT UPPER(name) AS city_nameFROM cities ORDER BY nameLIMIT 5 OFFSET 5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'cities ORDER BY nameLIMIT 5 OFFSET 5' at line 1
mysql> SELECT UPPER(name) AS name
    -> FROM cities
    -> ORDER BY name
    -> LIMIT 5 OFFSET 5;
+--------------------+
| name               |
+--------------------+
| ГОРЛІВКА           |
| ДНІПРО             |
| ДОНЕЦЬК            |
| ДРОГОБИЧ           |
| ЄВПАТОРІЯ          |
+--------------------+
5 rows in set (0.00 sec)

mysql> SELECT name AS city_name, CHAR_LENGTH(name) AS name_lengthFROM citiesWHERE CHAR_LENGTH(name) NOT IN (8, 9, 10);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'citiesWHERE CHAR_LENGTH(name) NOT IN (8, 9, 10)' at line 1
mysql> SELECT name AS city_name, CHAR_LENGTH(name) AS name_length FROM cities WHERE CHAR_LENGTH(name) NOT IN (8, 9, 10);
+------------------------------------------+-------------+
| city_name                                | name_length |
+------------------------------------------+-------------+
| Київ                                     |           4 |
| Харків                                   |           6 |
| Одеса                                    |           5 |
| Дніпро                                   |           6 |
| Донецьк                                  |           7 |
| Львів                                    |           5 |
| Севастополь                              |          11 |
| Вінниця                                  |           7 |
| Сімферополь                              |          11 |
| Херсон                                   |           6 |
| Полтава                                  |           7 |
| Черкаси                                  |           7 |
| Суми                                     |           4 |
| Житомир                                  |           7 |
| Хмельницький                             |          12 |
| Рівне                                    |           5 |
| Кропивницький                            |          13 |
| Івано-Франківськ                         |          16 |
| Луцьк                                    |           5 |
| Біла Церква                              |          11 |
| Краматорськ                              |          11 |
| Керч                                     |           4 |
| Сєвєродонецьк                            |          13 |
| Хрустальний                              |          11 |
| Ужгород                                  |           7 |
| Кам'янець-Подільський                    |          21 |
| Бровари                                  |           7 |
| Конотоп                                  |           7 |
+------------------------------------------+-------------+
28 rows in set (0.00 sec)

mysql> SELECT region, SUM(population) AS total_population FROM cities WHERE region IN ('C', 'S') GROUP BY region;
+--------+------------------+
| region | total_population |
+--------+------------------+
| S      |          4177039 |
| C      |          2086035 |
+--------+------------------+
2 rows in set (0.00 sec)

mysql> SELECT region, AVG(population) AS average_population FROM cities WHERE region = 'W' GROUP BY region;
+--------+--------------------+
| region | average_population |
+--------+--------------------+
| W      |        260186.4545 |
+--------+--------------------+
1 row in set (0.00 sec)

mysql> SELECT region, COUNT(*) AS city_count FROM cities WHERE region = 'E' GROUP BY region;
+--------+------------+
| region | city_count |
+--------+------------+
| E      |         17 |
+--------+------------+
1 row in set (0.00 sec)

mysql> notee
