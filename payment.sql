/* if you are using sqlite the following are not necessary */
DROP DATABASE IF EXISTS payment;
CREATE DATABASE payment;
/* if failed on following CREATE USER sql due to exits laolao already just delete it and redo >.<*/
CREATE USER 'laolao'@'localhost' IDENTIFIED BY 'laolao';
GRANT ALL PRIVILEGES ON payment.* TO 'laolao'@'localhost';
USE payment;
/* if you are using sqlite please start here */
DROP TABLE IF EXISTS user;
/* group 1 */
CREATE TABLE user(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY
	/* if you are using sqlite please use following instead */
	/* id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT */
);
=======

--
-- Tabellenstruktur für Tabelle `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `AID` char(50) NOT NULL DEFAULT '',
  `TYPE` bit(1) DEFAULT NULL,
  `UID` char(50) DEFAULT NULL,
  `BALANCE` decimal(12,2) DEFAULT NULL,
  `BANKACCOUNT` char(50) DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `UID` (`UID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buyer`
--

CREATE TABLE IF NOT EXISTS `buyer` (
  `USERNAME` char(50) DEFAULT NULL,
  `EMAIL` char(50) NOT NULL DEFAULT '',
  `PASSWORDLOGIN` char(50) DEFAULT NULL,
  `PASSWORDPAYMENT` char(50) DEFAULT NULL,
  `BALANCE` decimal(12,2) DEFAULT NULL,
  `VIP` bit(1) DEFAULT NULL,
  `AUTHENTICATED` bit(1) DEFAULT NULL,
  `CREDIT` char(50) DEFAULT NULL,
  PRIMARY KEY (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `receiveaddress`
--

CREATE TABLE IF NOT EXISTS `receiveaddress` (
  `ADDRESSID` char(50) NOT NULL DEFAULT '',
  `UID` char(50) DEFAULT NULL,
  `TYPE` bit(1) DEFAULT NULL,
  `RECEIVERNAME` char(50) DEFAULT NULL,
  `RECEIVERPHONE` char(20) DEFAULT NULL,
  `PROVINCE` char(50) DEFAULT NULL,
  `CITY` char(50) DEFAULT NULL,
  `STRICT` char(50) DEFAULT NULL,
  `STREET` char(100) DEFAULT NULL,
  PRIMARY KEY (`ADDRESSID`),
  KEY `UID` (`UID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seller`
--

CREATE TABLE IF NOT EXISTS `seller` (
  `USERNAME` char(50) DEFAULT NULL,
  `EMAIL` char(50) NOT NULL DEFAULT '',
  `PASSWORDLOGIN` char(50) DEFAULT NULL,
  `BALANCE` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `EMAIL` char(50) NOT NULL DEFAULT '',
  `TYPE` bit(1) NOT NULL DEFAULT b'0',
  `USERNAME` char(50) DEFAULT NULL,
  `PHONE` char(20) DEFAULT NULL,
  PRIMARY KEY (`EMAIL`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`UID`, `TYPE`) REFERENCES `user` (`EMAIL`, `TYPE`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `receiveaddress`
--
ALTER TABLE `receiveaddress`
  ADD CONSTRAINT `receiveaddress_ibfk_1` FOREIGN KEY (`UID`, `TYPE`) REFERENCES `user` (`EMAIL`, `TYPE`) ON DELETE CASCADE;

/* group 2 */
CREATE TABLE transaction(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY
);
/* if you are using sqlite please use following instead */
/* 
CREATE TABLE transactions(
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);
 */

/* group 3 */
DROP TABLE IF EXISTS goods;
CREATE TABLE goods(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	/* if you are using sqlite please use following instead */
	/* id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT */
	type INTEGER NOT NULL
);

DROP TABLE IF EXISTS general_goods;
CREATE TABLE general_goods(
	id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(256),
	price numeric(15,2),
	seller_id INTEGER,
	bought_count INTEGER,
	score numeric(11,10),
	score_count INTEGER,
	place VARCHAR(64),
	image_uri VARCHAR(256),
	stock INTEGER,
	description VARCHAR(1024),
	foreign key (id) references goods(id) on delete cascade,
	foreign key (seller_id) references user(id) on delete cascade
);

DROP TABLE IF EXISTS hotel_room;
CREATE TABLE hotel_room(
	id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(256),
	price numeric(15,2),
	seller_id INTEGER,
	bought_count INTEGER,
	score numeric(11,10),
	score_count INTEGER,
	place VARCHAR(64),
	image_uri VARCHAR(256),
	stock INTEGER,
	description VARCHAR(1024),
	date_time BIGINT,
	suit_type VARCHAR(32),
	foreign key (id) references goods(id) on delete cascade,
	foreign key (seller_id) references user(id) on delete cascade
);

DROP TABLE IF EXISTS airplane_ticket;
CREATE TABLE airplane_ticket(
	id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(256),
	seller_id INTEGER,
	bought_count INTEGER,
	score numeric(11,10),
	score_count INTEGER,
	image_uri VARCHAR(256),
	stock INTEGER,
	description VARCHAR(1024),
	price numeric(15,2),
	departue_date_time BIGINT,
	arrival_date_time BIGINT,
	departue_place VARCHAR(64),
	arrival_place VARCHAR(64),
	non_stop BOOLEAN,
	carbin_type VARCHAR(32),
	foreign key (id) references goods(id) on delete cascade,
	foreign key (seller_id) references user(id) on delete cascade
);

DROP TABLE IF EXISTS browse_history;
CREATE TABLE browse_history(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	/* if you are using sqlite please use following instead */
	/* id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT */
	good_id INTEGER,
	user_id INTEGER,
	date_time BIGINT,
	foreign key (good_id) references goods(id) on delete cascade,
	foreign key (user_id) references user(id) on delete cascade
);

DROP TABLE IF EXISTS search_history;
CREATE TABLE search_history(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	/* if you are using sqlite please use following instead */
	/* id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT */
	search_key VARCHAR(256),
	user_id INTEGER,
	date_time BIGINT,
	foreign key (user_id) references user(id) on delete cascade
);

DROP TABLE IF EXISTS feedback;
CREATE TABLE feedback(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	/* if you are using sqlite please use following instead */
	/* id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT */
	user_id INTEGER,
	transaction_id INTEGER,
	score INTEGER,
	comment VARCHAR(1024),
	date_time BIGINT,
	foreign key (user_id) references user(id) on delete cascade,	
	foreign key (transaction_id) references transaction(id) on delete cascade
	/* if you are using sqlite please use following instead */
	/* foreign key (transaction_id) references transactions(id) on delete cascade */
);

DROP TABLE IF EXISTS shopping_cart;
CREATE TABLE shopping_cart(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	/* if you are using sqlite please use following instead */
	/* id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT */
	user_id INTEGER,
	good_id INTEGER,
	good_count INTEGER,
	foreign key (good_id) references goods(id) on delete cascade,
	foreign key (user_id) references user(id) on delete cascade
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id INTEGER NOT NULL PRIMARY KEY
);

/* group 4 */

/* group 5 */
