--1. Выведите значение колонки ContactName
SELECT ContactName
FROM otusQA

--2. Выведите все возможные значения колонки Country
SELECT Country
FROM otusQA;

--3. Выведите все записи, где City имеет значение London
SELECT *
FROM otusQA
WHERE City = 'London'

--4. Выведите все записи, где City не равен London
SELECT *
FROM otusQA
WHERE City != 'London'

--5. Выберите все записи, где Country равна Mexico и Postal Code 05021
SELECT *
FROM otusQA
WHERE Country = 'Mexico'
AND PostalCode = '05021'

--6. Выберете все записи у которых Country равна Mexico или Sweden
SELECT *
FROM otusQA
WHERE Country = 'Mexico'
OR Country = 'Sweden'

SELECT *
FROM otusQA
WHERE Country
IN ('Mexico','Sweden')
