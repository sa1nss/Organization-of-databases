mysql> use lab
Database changed
mysql> SELECT cities.name AS city_name, regions.name AS region_name
    -> FROM cities
    -> JOIN regions ON cities.region_id = regions.id
    -> WHERE cities.population > 350000;
ERROR 1054 (42S22): Unknown column 'cities.region_id' in 'on clause'
mysql> SELECT cities.name AS city_name, regions.name AS region_name FROM cities JOIN regions ON cities.region_id = regions.id WHERE cities.population > 350000;
ERROR 1054 (42S22): Unknown column 'cities.region_id' in 'on clause'
    -> SELECT cities.name AS city_name
    -> FROM cities
    -> JOIN regions ON cities.region_id = regions.id
    -> WHERE regions.name = 'Nord';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIBE cities
SELECT cities.name AS city_name
FROM cit' at line 2
mysql> 
mysql> SELECT cities.name AS city_name FROM cities JOIN regions ON cities.region_id = regions.id WHERE regions.name = 'Nord';
ERROR 1054 (42S22): Unknown column 'cities.region_id' in 'on clause'
mysql> SHOW COLUMNS FROM cities; SHOW COLUMNS FROM regions;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int unsigned | NO   | PRI | NULL    | auto_increment |
| name       | varchar(255) | NO   |     | NULL    |                |
| population | int unsigned | YES  |     | NULL    |                |
| region     | varchar(5)   | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| uuid          | varchar(1)   | NO   | PRI | NULL    |       |
| name          | varchar(255) | NO   |     | NULL    |       |
| area_quantity | int unsigned | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> SELECT cities.name AS city_name, regions.name AS region_name FROM cities JOIN regions ON cities.region = regions.uuid WHERE cities.population > 350000;
+------------------------+-------------+
| city_name              | region_name |
+------------------------+-------------+
| Київ                   | Nord        |
| Харків                 | East        |
| Одеса                  | South       |
| Дніпро                 | Center      |
| Донецьк                | East        |
| Запоріжжя              | East        |
| Львів                  | West        |
| Кривий Ріг             | South       |
| Миколаїв               | South       |
| Маріуполь              | South       |
| Луганськ               | East        |
| Севастополь            | South       |
| Вінниця                | West        |
+------------------------+-------------+
13 rows in set (0.00 sec)

mysql> SELECT cities.name AS city_name FROM cities JOIN regions ON cities.region = regions.uuid WHERE regions.name = 'Nord';
+-----------------------+
| city_name             |
+-----------------------+
| Київ                  |
| Чернігів              |
| Житомир               |
| Біла Церква           |
| Бровари               |
+-----------------------+
5 rows in set (0.00 sec)

mysql> notee
