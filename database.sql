-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: 45.138.74.69    Database: std_2191_exam
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `year` int NOT NULL,
  `publisher` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `size` int NOT NULL,
  `covers_id` int NOT NULL,
  PRIMARY KEY (`id`,`covers_id`),
  KEY `fk_book_covers1_idx` (`covers_id`),
  CONSTRAINT `fk_book_covers1` FOREIGN KEY (`covers_id`) REFERENCES `covers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (2,'Преступление и наказание','Нищий и болезненно гордый студент Родион Романович Раскольников решает проверить, способен ли он на поступок, возвышающий его над «обычными» людьми. Для этого он убивает жалкую старую ростовщицу — а затем и её сестру, случайно оказавшуюся на месте преступления.',1866,'АСТ','Достоевский Федор Михайлович',672,2),(4,'Герой нашего времени','Смысл «Героя нашего времени» - это отражение эпохи, предостережение будущему поколению. Это яркий пример того, как можно быть умным, образованным человеком, но потерять себя, суть своего существования.',1840,'Азбука','Лермонтов Михаил Юрьевич',416,4),(6,'Евгений Онегин','«„Онегина“ можно назвать энциклопедией русской жизни и в высшей степени народным произведением». Из романа, как и из энциклопедии, можно узнать практически всё об эпохе: о том, как одевались, и что было в моде, что люди ценили больше всего, о чём они разговаривали, какими интересами они жили.',1833,'Азбука','Александр Сергеевич Пушкин',448,6),(9,'Мертвые души','Тема — жизнь и нравы помещиков России в 1830-х годах. Идея заложена в символическом названии поэмы — показать порочность той жизни, вытащить на поверхность проблемы общества. Мертвые души — это не только умершие крестьяне, которых скупал Чичиков. Автор считал всех своих персонажей духовно мертвыми.',1842,'Азбука','Николай Васильевич Гоголь',352,9),(10,'Ревизор','Темой этой комедии социально-сатирической направленности являются пороки общества, чиновничество и его бездеятельность, лицемерие, духовная бедность, общечеловеческая глупость.',1836,'АСТ','Николай Васильевич Гоголь',224,10),(11,'Тарас Бульба','Если описывать «Тараса Бульбу» кратко, то это повесть о старом казацком полковнике, который встречает двух вернувшихся из киевской академии молодых сыновей, Остапа и Андрия. Бульба решает, что нет лучше ученья, чем настоящий бой, и посылает сыновей в Запорожскую Сечь.',1835,'c','Николай Васильевич Гоголь',320,11),(14,'Шантарам','Представляем читателю один из самых поразительных романов начала XXI века (в 2015 году получивший долгожданное продолжение – «Тень горы»). Эта преломленная в художественной форме исповедь человека, который сумел выбраться из бездны и уцелеть, разошлась по миру тиражом четыре миллиона экземпляров (из них полмиллиона – в России) и заслужила восторженные сравнения с произведениями лучших писателей Нового времени, от Мелвилла до Хемингуэя. Подобно автору, герой этого романа много лет скрывался от закона. Лишенный после развода с женой родительских прав, он пристрастился к наркотикам, совершил ряд ограблений и был приговорен австралийским судом к девятнадцати годам заключения. Бежав на второй год из тюрьмы строгого режима, он добрался до Бомбея, где был фальшивомонетчиком и контрабандистом, торговал оружием и участвовал в разборках индийской мафии, а также нашел свою настоящую любовь, чтобы вновь потерять ее, чтобы снова найти…',2003,'Азбука-Аттикус','Грегори Дэвид Робертс',456,17),(15,'Маленький принцd','«Маленький принц» — аллегорическая повесть, наиболее известное произведение Антуана де Сент-Экзюпери. Рисунки в книге выполнены самим автором и не менее знамениты, чем сама книга. Важно, что это не иллюстрации, а органическая часть произведения в целом: сам автор и герои сказки всё время ссылаются на рисунки и даже спорят о них. Уникальные иллюстрации в «Маленьком принце» разрушают языковые барьеры, становятся частью универсального визуального лексикона, понятного каждому. «Ведь все взрослые сначала были детьми, только мало кто из них об этом помнит» — Антуан де Сент-Экзюпери, из посвящения к книге.',2005,'СОЮЗ','Антуан де Сент-Экзюпери',201,15),(16,'Сто лет одиночества','Странная, поэтичная, причудливая история города Макондо, затерянного где-то в джунглях, - от сотворения до упадка. История рода Буэндиа - семьи, в которой чудеса столь повседневны, что на них даже не обращают внимания. Клан Буэндиа порождает святых и грешников, революционеров, героев и предателей, лихих авантюристов - и женщин, слишком прекрасных для обычной жизни. В нем кипят необычайные страсти - и происходят невероятные события. Однако эти невероятные события снова и снова становятся своеобразным \"волшебным зеркалом\", сквозь которое читателю является подлинная история Латинской Америки.',2007,'АСТ','Габриэль Гарсиа Маркес',313,16),(17,'Двенадцать стульев','Знаменитый роман-фельетон И.Ильфа и Е.Петрова «Двенадцать стульев» впервые был опубликован в 1928 году, а сегодня его называют в числе культовых произведений отечественной литературы XX века. История двух аферистов, пустившихся на поиски брильянтов мадам Петуховой, пользуется неизменным успехом у читателей. Имя Остапа Бендера. великого комбинатора, стало нарицательным, а сам роман разошелся на цитаты и выдержал сотни успешных переизданий. Во время революции и последовавшего за ней краткого периода военного коммунизма многие прятали свои ценности как можно надежнее. И вот Ипполит Матвеевич Воробьянинов, бывший Старгородский предводитель дворянства и светский лев, а ныне - скромный делопроизводитель ЗАГСа, узнает от умирающей тещи, что некогда она спрятала свои бриллианты и жемчуга в общей сложности на 150 000 золотых рублей под обивку одного из двенадцати стульев гостиного гарнитура работы известного мастера Гамбса. Бросив все, Воробьянинов бросается на поиски стульев, в чем ему, конечно же, небескорыстно, берется помочь молодой авантюрист, \"великий комбинатор\" Остап Бендер. Найти следы разрозненного гарнитура непросто. Не облегчает положения и то, что перед смертью теща Воробьянинова открыла тайну сокровищ и своему исповеднику, отцу Федору, всю жизнь мечтавшему о собственном свечном заводике в Самаре...',1928,'Public Domain','Евгений Петров',289,18),(18,'Великий Гэтсби','\"Великий Гэтсби\" - вершина не только в творчестве Ф. С. Фицджеральда, но и одно из высших достижений в мировой прозе XX века. Хотя действие романа происходит в \"бурные\" двадцатые годы прошлого столетия, когда состояния делались буквально из ничего и вчерашние преступники в одночасье становились миллионерами, книга эта живет вне времени, ибо, повествуя о сломанных судьбах поколения \"века джаза\", давно стала универсальным символом бессмысленности погони человека за ложной целью.',2011,'Эксмо','Фрэнсис Скотт Фицджеральд',333,13),(19,'Гарри Поттер и философский камень','Самая знаменитая сага новейшего времени разошлась рекордным тиражом - более 400 миллионов экземпляров на 68 языках (включая эсперанто, древнегреческий и латынь). Книги Роулинг сумели оторвать детей и взрослых от экранов компьютеров и стали мощнейшим импульсом для интереса к чтению в современную эпоху. Жизнь десятилетнего Гарри Поттера нельзя назвать сладкой: его родители умерли, едва ему исполнился год, а от дяди и тётки, взявших сироту на воспитание, достаются лишь тычки да подзатыльники. Но в одиннадцатый день рождения Гарри всё меняется. Странный гость, неожиданно появившийся на пороге, приносит письмо, из которого мальчик узнаёт, что на самом деле он чистокровный волшебник и принят в Хогвартс — школу магии. А уже через пару недель Гарри будет мчаться в поезде Хогвартс-экспресс навстречу новой жизни, где его ждут невероятные приключения, верные друзья и самое главное — ключ к разгадке тайны смерти его родителей.',2007,'Pottermore limited','Джоан К. Роулинг',501,14);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_genres`
--

DROP TABLE IF EXISTS `book_has_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_has_genres` (
  `book_id` int NOT NULL,
  `genres_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`genres_id`),
  KEY `fk_book_has_genres_genres1_idx` (`genres_id`),
  KEY `fk_book_has_genres_book_idx` (`book_id`),
  CONSTRAINT `fk_book_has_genres_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_book_has_genres_genres1` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_genres`
--

LOCK TABLES `book_has_genres` WRITE;
/*!40000 ALTER TABLE `book_has_genres` DISABLE KEYS */;
INSERT INTO `book_has_genres` VALUES (2,1),(4,1),(6,1),(9,1),(10,1),(11,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(19,6),(2,13),(10,16),(4,20);
/*!40000 ALTER TABLE `book_has_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covers`
--

DROP TABLE IF EXISTS `covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(45) NOT NULL,
  `MIME_type` varchar(45) NOT NULL,
  `MD5_hash` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_name_UNIQUE` (`file_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covers`
--

LOCK TABLES `covers` WRITE;
/*!40000 ALTER TABLE `covers` DISABLE KEYS */;
INSERT INTO `covers` VALUES (1,'kapitanskaya dochka.jpg','image/jpg','1c21ffb75531a96dfe5272874f403f1d'),(2,'prestuplenie i nakazanie.jpg','image/jpg','94a274a2dfbc3885b8f17235a01ea83f'),(3,'voina i mir.jpg','image/jpg','6687ae39c2c09133f10b99f7b7d5bee4'),(4,'geroy nashego vremeni.jpg','image/jpg','ea233f545829117d544e216a2fe8c56f'),(5,'idiot.jpg','image/jpg','c75c918e60973d9482df6a8629fda5d2'),(6,'evgeniy onegin.jpg','image/jpg','72cf46984d9386caa58340a55c1e8fd5'),(7,'oblomov.jpg','image/jpg','dc008a9866c2541c3e00a5d46262964d'),(8,'gore ot uma.jpg','image/jpg','ea233f545829117d544e216a2fe8c56f'),(9,'mertvye dushi.jpg','image/jpg','3ecc6a4ca06700af0c436467f613bd85'),(10,'revizor.jpg','image/jpg','bf0ffe6e001274816a5e8ddbfb7d97b0'),(11,'taras bulba.jpg','image/jpg','3977257dc73a0c6d2dc4aa3b3ec38c7f'),(13,'gatsbi.jpg','image/jpg','3ecc6a4ca06700af0c436467f613bd85'),(14,'harry.jpg','image/jpg','ea233f545829117d544e216a2fe8c56f'),(15,'prince.jpg','image/jpg','1c21ffb75531a96dfe5272874f403f1d'),(16,'sto.jpg','image/jpg','3977257dc73a0c6d2dc4aa3b3ec38c7f'),(17,'tarara.jpg','image/jpg','ea233f545829117d544e216a2fe8c56f'),(18,'twelve.jpg','image/jpg','3ecc6a4ca06700af0c436467f613bd85');
/*!40000 ALTER TABLE `covers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (9,'Военная проза'),(21,'Детская Литература'),(10,'Историческая проза'),(2,'Исторический жанр'),(16,'Комедия'),(4,'Криминальный жанр'),(8,'Любовный роман'),(5,'Мистерия'),(22,'Научная литература'),(18,'Новелла'),(17,'Пикареска'),(19,'Приключения'),(20,'Проза'),(6,'Психологический реализм'),(1,'Роман'),(11,'Романтизм'),(13,'Сатира'),(12,'Фикшн'),(3,'Философский роман'),(23,'Фэнтези');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grade` int NOT NULL,
  `text` text NOT NULL,
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `book_id` int NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_book1_idx` (`book_id`),
  KEY `fk_reviews_users1_idx` (`users_id`),
  CONSTRAINT `fk_reviews_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reviews_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (7,5,'dasdasd','2023-06-22 21:40:32',18,1),(8,5,'dsadas','2023-06-22 21:50:25',19,2),(9,5,'dsad','2023-06-22 22:13:07',9,2),(10,5,'dasddsaddsad','2023-06-22 22:21:29',4,2),(11,2,'нет','2023-06-22 22:23:23',4,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'администратор','суперпользователь, имеет полный доступ к системе, в том числе к созданию и удалению книг'),(2,'модератор','может редактировать данные книг и производить модерацию рецензий'),(3,'пользователь','может оставлять рецензии');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password_hash` varchar(64) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `roles_id` int NOT NULL,
  PRIMARY KEY (`id`,`roles_id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_users_roles1_idx` (`roles_id`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','Дрожилкин','Вадим','Романович',1),(2,'moder','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','Антон','Антон','Антон',2),(3,'user','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','Петров','Петр','Петрович',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-22 23:16:18
