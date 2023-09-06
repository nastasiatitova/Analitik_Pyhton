/*
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Необходимые поля таблицы: 
product_name (название товара), 
manufacturer (производитель), 
product_count (количество), 
price (цена). 
Заполните БД произвольными данными. 
*/

-- Создание базы для ДЗ
CREATE DATABASE dz1_database;

-- Удаление таблицы
DROP TABLE `dz1_database`.`mobile_phones`;

-- Создание таблицы с мобильными телефонами: 
CREATE TABLE `dz1_database`.`mobile_phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(80) NULL,
  `manufacturer` VARCHAR(80) NULL,
  `product_count` INT NULL,
  `price` NUMERIC(15, 2) NULL,
  PRIMARY KEY (`id`));

-- Заполнение  таблицы данными
INSERT INTO `dz1_database`.`mobile_phones` 
  (`product_name`, `manufacturer`, `product_count`, `price`) 
VALUES 
('Honor X9A', 'Honor', 5, 1899),
('Xiaomi Redmi Note 12', 'Xiaomi', 1, 1250),
('Huawei P60', 'Huawei', 7, 2750),
('Nokia 3310', 'Nokia', 5, 980),
('Samsung Galaxy A30', 'Samsung', 2, 8499),
('Apple iPhone 13 128 ГБ', 'Apple', 1, 76299);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT `product_name`, `manufacturer`, `price` 
FROM `dz1_database`.`mobile_phones`
WHERE `product_count` > 2;

-- 3. Выведите весь ассортимент товаров марки "Samsung"
SELECT * 
FROM `dz1_database`.`mobile_phones`
WHERE `manufacturer` = 'Samsung';

-- 4. С помощью SELECT-запроса с оператором LIKE / REGEXP найти
-- 4.1. Выведите весь ассортимент товаров марки "Iphone"
SELECT * 
FROM `dz1_database`.`mobile_phones`
WHERE `product_name` LIKE '%Iphone%';

-- 4.2. Товары, в которых есть упоминание "Samsung"
SELECT * 
FROM `dz1_database`.`mobile_phones`
WHERE `product_name` LIKE '%Samsung%';

-- 4.3. Товары, в названии которых есть ЦИФРЫ
SELECT * 
FROM `dz1_database`.`mobile_phones`
WHERE `product_name` REGEXP '[0-9]';

-- 4.4. Товары, в названии которых есть ЦИФРА "8"
SELECT * 
FROM `dz1_database`.`mobile_phones`
WHERE `product_name` LIKE '%8%';
