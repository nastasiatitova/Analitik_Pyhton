USE vk;

INSERT INTO `users` 
VALUES ('1', 'Yuriy', 'Zhirkov', '1983yz2021@mail.ru', '5', '89033602667'),
	('2', 'Cristiano', 'Ronaldo', '1985cr07@jmail.ru', '3', '89233719285'),
	('3', 'Lionel', 'Messi', '1987lm10@mail.ru', '8', '89021984176'),
	('4', 'Zlatan', 'Ibrahimovich', '1981zi09@mail.ru', '7', '89022775317'),
	('5', 'David', 'Beckham', '1976dava@mail.ru', '2', '89066187164'),
	('6', 'Zinedine', 'Zidane', '1972zizou@mail.ru', '9', '89033817562'),
	('7', 'Valeriy', 'Karpin', '1969valera10karp@mail.ru', '2', '89066318275'),
	('8', 'Xabi', 'Alonso', '1982xabi14@mail.ru', '3', '89022817562'),
	('9', 'Alexey', 'Smertin', 'alexeydeath1976@mail.ru', '7', '89057661238'),
	('10', 'Luis', 'Figo', 'figo197310@mail.ru', '4', '89066381726');

INSERT INTO `profiles` 
VALUES ('1','М','1986-01-11',NULL,NOW(),'Москва'),
    ('2','М','2002-02-12',NULL,NOW(),'Сочи'),
    ('3','Ж','2001-03-13',NULL,NOW(),'Калининград'),
    ('4','Ж','2021-04-14',NULL,NOW(),'Киров'),
    ('5','М','2014-05-15',NULL,NOW(),'Киев'),
    ('6','М','2007-06-16',NULL,NOW(),'Архангельск'),
    ('7','М','2005-07-27',NULL,NOW(),'Санкт-Петербург'),
    ('8','Ж','1995-08-01',NULL,NOW(),'Владивосток'),
    ('9','Ж','2015-09-05',NULL,NOW(),'Воркута'),
    ('10','Ж','2020-10-07',NULL,NOW(),'Севастополь');
       
    
DROP TABLE IF EXISTS commente;
CREATE TABLE comment (
    id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), -- можно будет даже не упоминать это поле при вставке

    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'комментарий к медиа файлу';

DROP TABLE IF EXISTS comment_to_media;
CREATE TABLE comment_to_media (
    id SERIAL,
    media_id BIGINT UNSIGNED NOT NULL,
    comment_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (comment_id) REFERENCES comment(id)
) COMMENT 'связь media и comment';

-- Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных

 ALTER TABLE profiles
ADD COLUMN is_active BIT DEFAULT 1;

UPDATE profiles
SET is_active = 0
WHERE (birthday + INTERVAL 18 YEAR) > NOW();   

select *
from profiles
where is_active = 0
order by birthday;

select *
from profiles
where is_active = 1
order by birthday;

INSERT INTO `messages` VALUES 
('1','1','2','Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et. Nam accusantium aut qui quae nesciunt non.','1995-08-28 22:44:29'),
('2','2','1','Sint dolores et debitis est ducimus. Aut et quia beatae minus. Ipsa rerum totam modi sunt sed. Voluptas atque eum et odio ea molestias ipsam architecto.',now()),
('3','3','1','Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi. Et tempora repudiandae saepe quo.','1993-09-14 19:45:58'),
('4','1','3','Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit. Facere eum distinctio assumenda omnis est delectus magnam.','1985-11-25 16:56:25'),
('5','1','5','Voluptas omnis enim quia porro debitis facilis eaque ut. Id inventore non corrupti doloremque consequuntur. Molestiae molestiae deleniti exercitationem sunt qui ea accusamus deserunt.','1999-09-19 04:35:46'),
('6','1','6','Rerum labore culpa et laboriosam eum totam. Quidem pariatur sit alias. Atque doloribus ratione eum rem dolor vitae saepe.','1973-11-09 08:12:04'),
('7','1','7','Perspiciatis temporibus doloribus debitis. Et inventore labore eos modi. Quo temporibus corporis minus. Accusamus aspernatur nihil nobis placeat molestiae et commodi eaque.','1998-04-09 00:00:26'),
('8','8','8','Suscipit dolore voluptas et sit vero et sint. Rem ut ratione voluptatum assumenda nesciunt ea. Quas qui qui atque ut. Similique et praesentium non voluptate iure. Eum aperiam officia quia dolorem.','2005-08-20 18:40:27'),
('9','9','9','Et quia libero aut vitae minus. Rerum a blanditiis debitis sit nam. Veniam quasi aut autem ratione dolorem. Sunt quo similique dolorem odit totam sint sed.','2013-03-19 04:10:10'),
('10','4','1','Aut enim sint voluptas saepe. Ut tenetur quos rem earum sint inventore fugiat. Eaque recusandae similique earum laborum.','1977-10-15 23:26:40'),
('11','4','1','Nisi rerum officiis officiis aut ad voluptates autem. Dolor nesciunt eum qui eos dignissimos culpa iste. Atque qui vitae quos odit inventore eum. Quam et voluptas quia amet.','1977-10-13 19:40:32'),
('12','4','1','Consequatur ut et repellat non voluptatem nihil veritatis. Vel deleniti omnis et consequuntur. Et doloribus reprehenderit sed earum quas velit labore.','1998-05-24 10:09:36'),
('13','2','1','Iste deserunt in et et. Corrupti rerum a veritatis harum. Ratione consequatur est ut deserunt dolores.','1993-01-30 15:51:38'),
('14','8','1','Minus praesentium ipsum iusto ipsum et a nobis. Aut distinctio enim dolor suscipit et. Quia culpa molestiae architecto quod. Error nulla qui et harum sapiente maxime qui sed.','1986-07-17 11:23:56'),
('15','8','1','Explicabo nostrum eius cum molestiae. Et deserunt aut consectetur molestiae. Illo veritatis sed ab.','2002-06-22 15:10:59'),
('16','8','1','Excepturi consequatur ducimus voluptatum. Est sed perferendis ducimus officia et. Qui nemo sapiente harum rerum.','2007-09-14 22:06:16'),
('17','8','1','Non deserunt quis non illum. In vel exercitationem dolore reiciendis non animi sequi cumque. Officia et repellat in aut voluptas. Dignissimos sed voluptatem minima eligendi. Magnam porro omnis mollitia aspernatur error quia.','2006-06-16 19:28:59'),
('18','8','1','Minus tenetur molestiae laudantium est voluptatem tempora. Sed ab veniam porro similique cumque. Accusamus illo est et tempora excepturi odit.','1977-11-04 08:02:22'),
('19','8','1','At ratione quae facere minima exercitationem vel ipsum ipsam. Qui eligendi repellat ut unde quos hic sit. Itaque expedita voluptatem id numquam. Provident culpa expedita alias optio ipsum id. Voluptatum quae quidem nihil aut nemo voluptatibus.','1975-06-25 22:37:18'),
('20','8','1','Nam dignissimos nobis qui qui voluptate. Dolor voluptas praesentium quis tenetur deleniti dolorem incidunt. Cupiditate qui nam excepturi.','2007-03-22 10:13:05'),
('21','8','1','Molestias ratione tenetur sint. Vel rerum voluptas vel vitae et aut non autem. Distinctio sunt in dignissimos esse eligendi praesentium. Ut totam autem vel sapiente architecto et.','2003-01-11 19:37:45'),
('22','8','1','Perferendis in eius architecto debitis exercitationem. Optio deleniti ad dolor sapiente soluta. Quisquam deserunt autem amet magni quasi quo dolores. Expedita ea omnis omnis sint.','2010-04-13 15:06:20');

-- Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней) 

ALTER TABLE messages
ADD COLUMN is_deleted BIT DEFAULT 0;

-- Сделаем отметку на пять сообщений с 'неправильной' датой.

update messages 
set created_at = now() + interval 1 year
limit 3;

-- Сделаем отметку на сообщения, присланные 'из будущего', как удаленные.

update messages
set is_deleted = 1
where created_at > NOW();

-- Выполним удаление сообщений, помеченных, как присланные 'из будущего'.
-- delete from messages 
-- where created_at > NOW();

-- После удаления сообщений, присланных 'из будущего', можно сделать проверку всех сообщений в таблице 'messages' (что не обязательно).

select *
from messages
order by created_at desc;