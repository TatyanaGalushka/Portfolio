/*
Исходные данные: есть 2 таблицы users и levels с соответствующим набором полей.
Структура таблиц и значения полей указаны ниже.
    Таблица - users
id_user user_name   level_id    skill
  1      Anton        1         900000
  2      Denis        3         4000
  3      Petr         2         50000
  4      Andrey       4         20
  5      Olga         1         600000
  6      Anna         1         1600000

     Таблица - levels
id_level	level_name
  1	         admin
  2	         power_user
  3	         user
  4	         guest
*/

CREATE TABLE users
( id_user Serial PRIMARY KEY,
  user_name varchar NOT null,
  level_id  int     NOT null,
  skill     int     NOT null)

INSERT INTO users
    (id_user, user_name, level_id, skill)
VALUES
    (DEFAULT, 'Anton', 1, 900000),
    (DEFAULT, 'Denis', 3, 4000),
    (DEFAULT, 'Petr', 2, 50000),
    (DEFAULT, 'Anrey', 4, 20),
    (DEFAULT, 'Olga', 1, 600000),
    (DEFAULT, 'Anna', 1, 1600000);

CREATE TABLE levels
( id_level Serial primary key,
    level_name varchar NOT null)

INSERT INTO levels (id_level, level_name)
VALUES
    (DEFAULT, 'admin'),
    (DEFAULT, 'power_user'),
    (DEFAULT, 'user'),
    (DEFAULT, 'guest');

/*
1. Отобрать из таблицы user всех пользователей, у которых level_id=1,
skill > 799000 и в имени встречается буква "a".
*/
SELECT user_name, level_id, skill
FROM users
WHERE level_id=1
AND skill>799000
AND user_name LIKE'%a%'

--2. Удалить всех пользователей, у которых skill меньше 100000.
DELETE FROM users
WHERE skill<100000

--3. Вывести все данные из таблицы user в порядке убывания по полю skill.
SELECT id_user, user_name, level_id, skill
FROM users
ORDER BY skill ASC

--4. Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10.
INSERT INTO users
(id_user, user_name, level_id, skill)
VALUES
(DEFAULT, 'Oleg', 4, 10);

/*
5. Обновить данные в таблице user - для пользователей с level_id меньше 2 проставить
skill 2000000
*/
UPDATE users
SET skill=2000000
WHERE level_id<2

--6. Выбрать user_name всех пользователей уровня admin используя подзапрос.
SELECT user_name
FROM users
WHERE level_id IN
(SELECT id_level
FROM levels
WHERE level_name='admin')

--7. Выбрать user_name всех пользователей уровня admin используя join.
SELECT user_name
FROM users
JOIN levels
ON level_id=id_level
WHERE level_name='admin'
