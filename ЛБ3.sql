/*Задание 14*/
SELECT * FROM t_Material;
SELECT * FROM t_Deliver;
SELECT * FROM t_caterer;

/*Задание 15*/
SELECT ID_Material, NAME, ID_Group FROM t_Material;

/*Задание 16*/
SELECT SURNAME, NAME, FATHERNAME, BIRTHDATE FROM t_Employer;

/*Задание 17*/
SELECT * FROM t_Employer
	WHERE SEX LIKE 'M';

/*Задание 18*/
SELECT * FROM t_caterer
	WHERE ID_caterer IN 
	(SELECT ID_caterer FROM t_Supply
		WHERE Supply_Date >= '01.04.2009'
		AND Supply_Date <= '30.06.2009');

/*Задание 19*/
SELECT * FROM t_Section
	WHERE ID_Section NOT IN
	(SELECT ID_Section FROM t_Deliver
		WHERE Deliver_DATE LIKE '%08.2009');

/*Задание 20*/
SELECT NAME FROM t_Section 
	WHERE ID_Section IN
	(SELECT ID_Section FROM t_Deliver
		WHERE Deliver_Date LIKE SYSDATE);

/*Задание 21*/
SELECT NAME FROM t_Material
	WHERE ID_Material IN 
	(SELECT ID_Material FROM t_Supply
		WHERE Supply_Date LIKE '%2017');

/*Задание 22*/
SELECT NAME FROM t_Material
	WHERE ID_Material NOT IN
	(SELECT ID_Material FROM t_Supply
		WHERE Supply_Date LIKE '%2017')
	AND ID_Material IN
		(SELECT ID_Material FROM t_Surplus
				WHERE VOLUME LIKE 0);

/*Задание 23*/
SELECT t_Section.ID_Section, t_Section.NAME, t_Employer.NAME,
	t_Employer.SURNAME, t_Employer.FATHERNAME, t_JOB.NAME
	FROM t_Section, t_Employer
	WHERE t_Section.ID_Employer = t_Employer.ID_Employer;

/*Задание 24*/
SELECT t_Section.ID_Section, t_Section.NAME, t_Employer.NAME,
	t_Employer.SURNAME, t_Employer.FATHERNAME, t_JOB.NAME
	FROM t_Section, t_Employer, t_JOB
	WHERE t_Section.ID_Employer = t_Employer.ID_Employer
	AND t_Employer.ID_JOB = t_JOB.ID_JOB;

/*Задание 25*/
SELECT t_caterer.NAME, t_Material.NAME, t_Supply.VOLUME,
	t_inprice.PRICE, t_Supply.Supply_Date
	FROM t_caterer, t_Material, t_Supply, t_inprice
	WHERE t_caterer.ID_caterer IN
	(SELECT ID_caterer FROM t_Supply
		WHERE Supply_Date BETWEEN '01.01.2009' AND '31.03.2009')
	AND t_Material.ID_Material = t_inprice.ID_Material
	AND t_Material.ID_Material = t_Supply.ID_Material
	AND t_caterer.ID_caterer = t_Supply.ID_caterer;

/*Задание 26*/
SELECT t_caterer.NAME, t_Material.NAME, t_Supply.VOLUME,
	t_inprice.PRICE, t_Supply.Supply_Date
	FROM t_caterer, t_Material, t_Supply, t_inprice
	WHERE t_caterer.ID_caterer IN
	(SELECT ID_caterer FROM t_Supply
		WHERE Supply_Date BETWEEN '01.01.2016' AND '31.03.2016')
	AND t_Material.ID_Material = t_inprice.ID_Material
	AND t_Material.ID_Material = t_Supply.ID_Material
	AND t_caterer.ID_caterer = t_Supply.ID_caterer
	AND t_caterer.Legal_Address LIKE 'Пермь%';

/*Задание 27*/
SELECT t_Material.ID_Material, t_Material.NAME,
	t_Store.NAME, t_Surplus.VOLUME
	FROM t_Material, t_Store, t_Surplus
	WHERE t_Store.ID_Store = t_Surplus.ID_Store
	AND t_Material.ID_Material = t_Surplus.ID_Material
	ORDER BY t_Material.ID_Material;

/*Задание 28*/
SELECT t_caterer.NAME, t_Material.NAME, t_Supply.VOLUME,
	t_inprice.PRICE, t_Supply.Supply_Date
	FROM t_caterer JOIN t_Material
	ON t_caterer.ID_caterer IN
		(SELECT ID_caterer FROM t_Supply
			WHERE Supply_Date BETWEEN '01.01.2009' AND '31.03.2018')
	JOIN t_Supply
	ON t_Supply.ID_Material = t_Material.ID_Material
		AND t_Supply.ID_caterer = t_caterer.ID_caterer
	JOIN t_inprice
	ON t_inprice.ID_Material = t_Material.ID_Material;

/*Задание 29*/
SELECT t_caterer.NAME, t_Material.NAME, t_Supply.VOLUME,
	t_inprice.PRICE, t_Supply.Supply_Date
	FROM t_caterer LEFT JOIN t_Supply
	ON t_Supply.ID_caterer = t_caterer.ID_caterer
	LEFT JOIN t_Material
	ON t_Supply.ID_Material = t_Material.ID_Material
	LEFT JOIN t_inprice
	ON t_inprice.ID_Material = t_Material.ID_Material;

/*Задание 30*/
SELECT t_Store.ID_Store, t_Store.NAME,
	t_Material.NAME, t_Surplus.VOLUME
	FROM t_Store LEFT JOIN t_Surplus
	ON t_Store.ID_Store = t_Surplus.ID_Store
	LEFT JOIN t_Material
	ON t_Material.ID_Material = t_Surplus.ID_Material
	ORDER BY t_Store.ID_Store;

/*Задание 31*/
SELECT t_Material.ID_Material, t_Material.NAME,
	t_Messure.NAME, t_inprice.PRICE
	FROM t_Material JOIN t_Messure
	ON t_Material.ID_Messure = t_Messure.ID_Messure
	JOIN t_inprice
	ON t_inprice.ID_Material = t_Material.ID_Material
		AND t_inprice.PRICE_DATE IN
			(SELECT PRICE_DATE FROM t_inprice
				WHERE PRICE_DATE BETWEEN '01.07.2009' AND '30.09.2009');

/*Задание 32*/
SELECT t_Material.ID_Material, t_Material.NAME,
	t_Messure.NAME, t_inprice.PRICE
	FROM t_Material LEFT JOIN t_Messure
	ON t_Material.ID_Messure = t_Messure.ID_Messure
	LEFT JOIN t_inprice
	ON t_inprice.ID_Material = t_Material.ID_Material;

/*Задание 33*/
ALTER TABLE t_Employer
	ADD ID_Manager INT;
UPDATE t_Employer
	SET ID_Manager = 1
		WHERE ID_Employer BETWEEN 2 AND 4;
UPDATE t_Employer
	SET ID_Manager = 3
		WHERE ID_Employer LIKE 5;

/*Задание 34*/
ALTER TABLE t_Group
	ADD M_Group INT;
UPDATE t_Group
	SET M_Group = 1
		WHERE ID_Group BETWEEN 1 AND 3;
UPDATE t_Group
	SET M_Group = 2
		WHERE ID_Group > 3;
SELECT * FROM t_Group
	WHERE M_Group = 1;
SELECT * FROM t_Group
	WHERE M_Group = 2;

/*Задание 35*/
CREATE TABLE t_Exemp(
	ID_Employer INT NOT NULL,
	SURNAME NVARCHAR2(20) NOT NULL,
	NAME NVARCHAR2(20) NOT NULL,
	FATHERNAME NVARCHAR2(20),
	BIRTHDATE DATE,
	ID_JOB INT,
	ID_Manager INT,
	CONSTRAINT PK_Exemp
		PRIMARY KEY (ID_Employer));

INSERT INTO t_Exemp (ID_Employer, SURNAME, NAME, FATHERNAME, BIRTHDATE, ID_JOB, ID_Manager)
	VALUES (1, 'Фамилия', 'Имя', 'Отчество', '13.03.1970', 2, 1);

/*Задание 36*/
ALTER TABLE t_Exemp
	ADD DISMISSED DATE;
UPDATE t_Exemp
	SET DISMISSED = '10.10.2010';

/*Задание 37*/
CREATE TABLE t_Contact(
	ID_Contact INT NOT NULL,
	ID_caterer INT,
	SURNAME NVARCHAR2(20) NOT NULL,
	NAME NVARCHAR2(20) NOT NULL,
	FATHERNAME NVARCHAR2(30),
	PHONE NVARCHAR2(12) NOT NULL,
	CONSTRAINT PK_Contact
		PRIMARY KEY (ID_Contact),
	CONSTRAINT FK_Contact_caterer
		FOREIGN KEY (ID_caterer)
		REFERENCES t_caterer (ID_caterer) ON DELETE CASCADE);

INSERT INTO t_Contact (ID_Contact, ID_caterer, SURNAME, NAME, FATHERNAME, PHONE)
	VALUES (1, 1, 'Фамилия1', 'Имя1', 'Отчество1', '89194826168');
INSERT INTO t_Contact (ID_Contact, ID_caterer, SURNAME, NAME, FATHERNAME, PHONE)
	VALUES (2, 2, 'Фамилия2', 'Имя2', 'Отчество2', '89124856754');
INSERT INTO t_Contact (ID_Contact, ID_caterer, SURNAME, NAME, FATHERNAME, PHONE)
	VALUES (3, 3, 'Фамилия3', 'Имя3', 'Отчество3', '89641536495');
INSERT INTO t_Contact (ID_Contact, ID_caterer, SURNAME, NAME, FATHERNAME, PHONE)
	VALUES (4, 4, 'Фамилия4', 'Имя4', 'Отчество4', '89121946957');
INSERT INTO t_Contact (ID_Contact, ID_caterer, SURNAME, NAME, FATHERNAME, PHONE)
	VALUES (5, 5, 'Фамилия5', 'Имя5', 'Отчество5', '89198456321');
SELECT SURNAME, NAME, FATHERNAME, PHONE FROM t_Contact;

/*Задание 38*/
SELECT * FROM t_caterer
	ORDER BY NAME;

/*Задание 39*/
SELECT * FROM t_caterer JOIN t_Contact
	ON t_caterer.ID_caterer = t_Contact.ID_caterer
	ORDER BY t_caterer.NAME, t_Contact.SURNAME, t_Contact.NAME, t_Contact.FATHERNAME;

/*Задание 40*/
SELECT t_Store.NAME, t_Material.NAME, t_Surplus.VOLUME
	FROM t_Store LEFT JOIN t_Surplus
	ON t_Store.ID_Store = t_Surplus.ID_Store
	LEFT JOIN t_Material
	ON t_Material.ID_Material = t_Surplus.ID_Material
	ORDER BY t_Store.ID_Store, t_Surplus.VOLUME DESC;

/*Задание 41*/
SELECT t_Material.NAME AS "Material", t_caterer.NAME AS "caterer", SUM (t_Supply.VOLUME) AS "VOLUME"
	FROM t_caterer JOIN t_Supply
	ON t_caterer.ID_caterer = t_Supply.ID_caterer
	JOIN t_Material
	ON t_Material.ID_Material = t_Supply.ID_caterer
	WHERE t_Supply.Supply_Date >= '01.01.2017'
	AND t_Supply.Supply_Date <= '31.12.2017'
	GROUP BY t_Material.NAME, t_caterer.NAME
	ORDER BY t_caterer.NAME, t_Material.NAME;

/*Задание 42*/
SELECT t_Material.NAME AS "Material", AVG (t_Supply.VOLUME * t_inprice.PRICE) AS "Sred"
	FROM t_Material LEFT JOIN t_Supply
	ON t_Material.ID_Material = t_Supply.ID_Material
	LEFT JOIN t_inprice
	ON t_Material.ID_Material = t_inprice.ID_Material
	WHERE t_Supply.Supply_Date >= '01.01.2017'
	AND t_Supply.Supply_Date <= '31.12.2017'
	GROUP BY t_Material.NAME
	ORDER BY t_Material.NAME;

/*Задание 43*/
SELECT t_Material.NAME AS "Material", SUM (t_Supply.VOLUME) AS "Summ"
	FROM t_Material LEFT JOIN t_Supply
	ON t_Material.ID_Material = t_Supply.ID_Material
	WHERE t_Supply.Supply_Date >= '01.01.2017'
	AND t_Supply.Supply_Date <= '31.12.2017'
	GROUP BY t_Material.NAME
	ORDER BY t_Material.NAME;

/*Задание 45*/
SELECT NAME FROM t_Store INNER JOIN t_Surplus
	ON t_Store.ID_Store = t_Surplus.ID_Store
	GROUP BY NAME HAVING SUM (VOLUME) = 0;

/*Задание 46*/
SELECT NAME FROM t_caterer INNER JOIN t_Supply
	ON t_caterer.ID_caterer = t_Supply.ID_caterer
	WHERE Supply_Date >= '01.01.2017'
	AND t_Supply.Supply_Date <= '31.12.2017'
	GROUP BY NAME HAVING SUM (VOLUME) < 1000;

/*Задание 47*/
SELECT NAME FROM t_caterer JOIN t_Supply
	ON t_caterer.ID_caterer = t_Supply.ID_caterer 
	WHERE Supply_Date >= '01.01.2017'
	AND t_Supply.Supply_Date <= '31.12.2017'
	GROUP BY NAME HAVING SUM (VOLUME) = MAX (VOLUME);