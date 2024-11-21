mysql> use lab
Database changed
mysql> CREATE TABLE categories ( id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100) NOT NULL, description TEXT);
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE articles ( id INT AUTO_INCREMENT PRIMARY KEY,
    -> title VARCHAR(255) NOT NULL,
    -> content TEXT NOT NULL,
    -> publish_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    -> category_id INT,
    -> FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE comments (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> article_id INT NOT NULL,
    -> author_name VARCHAR(100),
    -> content TEXT NOT NULL,
    -> сreated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    -> FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE ratings (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> article_id INT NOT NULL,
    -> user_ip VARCHAR(45) NOT NULL,
    -> rating TINYINT CHECK (rating BETWEEN 1 AND 5),
    -> created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    -> FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,
    -> UNIQUE (article_id, user_ip)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE users (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> username VARCHAR(100) UNIQUE NOT NULL,
    -> email VARCHAR(255) UNIQUE NOT NULL,
    -> password_hash VARCHAR(255) NOT NULL,
    -> created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO categories (name, description)
    -> VALUES ('IT', 'News about last technologies');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO articles (title, content, category_id)
    -> VALUES ('New Post of technologies', 'Some information...', 1);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO comments (article_id, author_name, content)
    -> VALUES (1, 'Daniil', 'So interesting Post!');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO ratings (article_id, user_ip, rating)
    -> VALUES (1, '192.168.50.1', 5);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO users (username, email, password_hash)
    -> VALUES ('Daniil', 'fjdsf@example.com', 'password');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM categories;
+----+------+------------------------------+
| id | name | description                  |
+----+------+------------------------------+
|  1 | IT   | News about last technologies |
+----+------+------------------------------+
1 row in set (0.00 sec)

mysql> SELECT articles.id, articles.title, articles.content, articles.publish_date, categories.name AS category_name
    -> FROM articles
    -> JOIN categories ON articles.category_id = categories.id
    -> WHERE articles.category_id = 1;
+----+--------------------------+---------------------+---------------------+---------------+
| id | title                    | content             | publish_date        | category_name |
+----+--------------------------+---------------------+---------------------+---------------+
|  1 | New Post of technologies | Some information... | 2024-11-21 15:51:20 | IT            |
+----+--------------------------+---------------------+---------------------+---------------+
1 row in set (0.00 sec)

mysql> Terminal close -- exit!
mysql> SELECT comments.author_name, comments.content FROM comments
    -> WHERE comments.article_id = 1;
ERROR 1046 (3D000): No database selected
mysql> use lab
Database changed
mysql> SELECT comments.author_name, comments.content FROM comments
    -> WHERE comments.article_id = 1;
+-------------+----------------------+
| author_name | content              |
+-------------+----------------------+
| Daniil      | So interesting Post! |
+-------------+----------------------+
1 row in set (0.00 sec)

mysql> SELECT article_id, AVG(rating) AS average_rating
    -> FROM ratings
    -> WHERE article_id = 1
    -> GROUP BY article_id;
+------------+----------------+
| article_id | average_rating |
+------------+----------------+
|          1 |         5.0000 |
+------------+----------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM users;
+----+----------+-------------------+---------------+---------------------+
| id | username | email             | password_hash | created_at          |
+----+----------+-------------------+---------------+---------------------+
|  1 | Daniil   | fjdsf@example.com | password      | 2024-11-21 15:51:49 |
+----+----------+-------------------+---------------+---------------------+
1 row in set (0.00 sec)

mysql> not tee
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'not tee' at line 1
mysql> notee
