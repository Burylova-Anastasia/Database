/*Заданте 6*/
CREATE SEQUENCE SEQ_caterer
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_Store
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_Material
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_Messure
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_Supply
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_Surplus
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_Deliver
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_inprice
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_Section
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_Employer
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_Group
	START WITH 1
	INCREMENT BY 1;
CREATE SEQUENCE SEQ_JOB
	START WITH 1
	INCREMENT BY 1;

/*Задание 7*/
INSERT INTO t_caterer (ID_caterer, NAME, Legal_Address, Actual_Address, E_Mail, PHONE, FAX)
	VALUES (SEQ_caterer.NEXTVAL, 'Поставщик 1', 'Город, улица, дом', 'Город, улица, дом', 'mail1@mail.ru', 89654123946, NULL);
INSERT INTO t_caterer (ID_caterer, NAME, Legal_Address, Actual_Address, E_Mail, PHONE, FAX)
	VALUES (SEQ_csterer.NEXTVAL, 'Поставщик 2', 'Город, улица, дом', 'Город, улица, дом', 'mail2@mail.ru', 89641234948, NULL);
INSERT INTO t_caterer (ID_caterer, NAME, Legal_Address, Actual_Address, E_Mail, PHONE, FAX)
	VALUES (SEQ_csterer.NEXTVAL, 'Поставщик 3', 'Город, улица, дом', 'Город, улица, дом', 'mail3@mail.ru', 89194589316, NULL);
INSERT INTO t_caterer (ID_caterer, NAME, Legal_Address, Actual_Address, E_Mail, PHONE, FAX)
	VALUES (SEQ_csterer.NEXTVAL, 'Поставщик 4', 'Город, улица, дом', 'Город, улица, дом', 'mail4@mail.ru', 89659127846, NULL);
INSERT INTO t_caterer (ID_caterer, NAME, Legal_Address, Actual_Address, E_Mail, PHONE, FAX)
	VALUES (SEQ_caterer.NEXTVAL, 'Поставщик 5', 'Город, улица, дом', 'Город, улица, дом', 'mail5@mail.ru', 89124127446, NULL);	

INSERT INTO t_Store (ID_Store, NAME)
	VALUES (SEQ_Store.NEXTVAL, 'Склад 1');
INSERT INTO t_Store (ID_Store, NAME)
	VALUES (SEQ_Store.NEXTVAL, 'Склад 2');
INSERT INTO t_Store (ID_Store, NAME)
	VALUES (SEQ_Store.NEXTVAL, 'Склад 3');
INSERT INTO t_Store (ID_Store, NAME)
	VALUES (SEQ_Store.NEXTVAL, 'Склад 4');
INSERT INTO t_Store (ID_Store, NAME)
	VALUES (SEQ_Store.NEXTVAL, 'Склад 5');

INSERT INTO t_Material (ID_Material, NAME, ID_Messure, ID_Group)
	VALUES (SEQ_Material.NEXTVAL, 'Материал 1', 1, 1);
INSERT INTO t_Material (ID_Material, NAME, ID_Messure, ID_Group)
	VALUES (SEQ_Material.NEXTVAL, 'Материал 2', 2, 2);
INSERT INTO t_Material (ID_Material, NAME, ID_Messure, ID_Group)
	VALUES (SEQ_Material.NEXTVAL, 'Материал 3', 3, 3);
INSERT INTO t_Material (ID_Material, NAME, ID_Messure, ID_Group)
	VALUES (SEQ_Material.NEXTVAL, 'Материал 4', 4, 4);
INSERT INTO t_Material (ID_Material, NAME, ID_Messure, ID_Group)
	VALUES (SEQ_Material.NEXTVAL, 'Материал 5', 5, 5);

INSERT INTO t_Messure (ID_Messure, NAME)
	VALUES (SEQ_Messure.NEXTVAL, 'ШТ');
INSERT INTO t_Messure (ID_Messure, NAME)
	VALUES (SEQ_Messure.NEXTVAL, 'М');
INSERT INTO t_Messure (ID_Messure, NAME)
	VALUES (SEQ_Messure.NEXTVAL, 'КГ');
INSERT INTO t_Messure (ID_Messure, NAME)
	VALUES (SEQ_Messure.NEXTVAL, 'Т');
INSERT INTO t_Messure (ID_Messure, NAME)
	VALUES (SEQ_Messure.NEXTVAL, 'СМ');

INSERT INTO t_Supply (ID_Supply, ID_caterer, ID_Material, ID_Store, Supply_Date, VOLUME)
	VALUES (SEQ_Supply.NEXTVAL, 1, 1, 1, '14.01.2017', 1);
INSERT INTO t_Supply (ID_Supply, ID_caterer, ID_Material, ID_Store, Supply_Date, VOLUME)
	VALUES (SEQ_Supply.NEXTVAL, 2, 2, 2, '19.02.2017', 2);
INSERT INTO t_Supply (ID_Supply, ID_caterer, ID_Material, ID_Store, Supply_Date, VOLUME)
	VALUES (SEQ_Supply.NEXTVAL, 3, 3, 3, '01.03.2017', 3);
INSERT INTO t_Supply (ID_Supply, ID_caterer, ID_Material, ID_Store, Supply_Date, VOLUME)
	VALUES (SEQ_Supply.NEXTVAL, 4, 4, 4, '08.04.2017', 4);
INSERT INTO t_Supply (ID_Supply, ID_caterer, ID_Material, ID_Store, Supply_Date, VOLUME)
	VALUES (SEQ_Supply.NEXTVAL, 5, 5, 5, '03.05.2017', 5);

INSERT INTO t_Surplus (ID_Surplus, ID_Material, ID_Store, VOLUME)
	VALUES (SEQ_Surplus.NEXTVAL, 1, 1, 1);
INSERT INTO t_Surplus (ID_Surplus, ID_Material, ID_Store, VOLUME)
	VALUES (SEQ_Surplus.NEXTVAL, 2, 2, 2);
INSERT INTO t_Surplus (ID_Surplus, ID_Material, ID_Store, VOLUME)
	VALUES (SEQ_Surplus.NEXTVAL, 3, 3, 3);
INSERT INTO t_Surplus (ID_Surplus, ID_Material, ID_Store, VOLUME)
	VALUES (SEQ_Surplus.NEXTVAL, 4, 4, 4);
INSERT INTO t_Surplus (ID_Surplus, ID_Material, ID_Store, VOLUME)
	VALUES (SEQ_Surplus.NEXTVAL, 5, 5, 5);

INSERT INTO t_Deliver (ID_Deliver, ID_Section, ID_Material, ID_Store, Deliver_DATE)
	VALUES (SEQ_Surplus.NEXTVAL, 1, 1, 1, '14.01.2017');
INSERT INTO t_Deliver (ID_Deliver, ID_Section, ID_Material, ID_Store, Deliver_DATE)
	VALUES (SEQ_Surplus.NEXTVAL, 2, 2, 2, '19.02.2017');
INSERT INTO t_Deliver (ID_Deliver, ID_Section, ID_Material, ID_Store, Deliver_DATE)
	VALUES (SEQ_Surplus.NEXTVAL, 3, 3, 3, '01.03.2017');
INSERT INTO t_Deliver (ID_Deliver, ID_Section, ID_Material, ID_Store, Deliver_DATE)
	VALUES (SEQ_Surplus.NEXTVAL, 4, 4, 4, '08.04.2017');
INSERT INTO t_Deliver (ID_Deliver, ID_Section, ID_Material, ID_Store, Deliver_DATE)
	VALUES (SEQ_Surplus.NEXTVAL, 5, 5, 5, '03.05.2017');

INSERT INTO t_inprice (ID_inprice, ID_Material, PRICE_DATE, PRICE)
	VALUES (SEQ_inprice.NEXTVAL, '14.01.2017', 1);
INSERT INTO t_inprice (ID_inprice, ID_Material, PRICE_DATE, PRICE)
	VALUES (SEQ_inprice.NEXTVAL, '19.02.2017', 2);
INSERT INTO t_inprice (ID_inprice, ID_Material, PRICE_DATE, PRICE)
	VALUES (SEQ_inprice.NEXTVAL, '01.03.2017', 3);
INSERT INTO t_inprice (ID_inprice, ID_Material, PRICE_DATE, PRICE)
	VALUES (SEQ_inprice.NEXTVAL, '08.04.2017', 4);
INSERT INTO t_inprice (ID_inprice, ID_Material, PRICE_DATE, PRICE)
	VALUES (SEQ_inprice.NEXTVAL, '03.05.2017', 5);

INSERT INTO t_Section (ID_Section, NAME, ID_Employer)
	VALUES (SEQ_Section.NEXTVAL, 'Цех 1', 1);
INSERT INTO t_Section (ID_Section, NAME, ID_Employer)
	VALUES (SEQ_Section.NEXTVAL, 'Цех 2', 2);
INSERT INTO t_Section (ID_Section, NAME, ID_Employer)
	VALUES (SEQ_Section.NEXTVAL, 'Цех 3', 3);
INSERT INTO t_Section (ID_Section, NAME, ID_Employer)
	VALUES (SEQ_Section.NEXTVAL, 'Цех 4', 4);
INSERT INTO t_Section (ID_Section, NAME, ID_Employer)
	VALUES (SEQ_Section.NEXTVAL, 'Цех 5', 5);

INSERT INTO t_Employer (ID_Employer, SURNAME, NAME, FATHERNAME, SEX, BIRTHDATE, MARRIAGE, ID_JOB)
	VALUES (SEQ_Employer.NEXTVAL, 'Фамилия', 'Имя', 'Отчество', 'Пол', 'Дата рождения', 'Семейное положение', 'Должность');
INSERT INTO t_Employer (ID_Employer, SURNAME, NAME, FATHERNAME)
	VALUES (SEQ_Employer.NEXTVAL, 'Фамилия', 'Имя', 'Отчество', 'Пол', 'Дата рождения', 'Семейное положение', 'Должность');
INSERT INTO t_Employer (ID_Employer, SURNAME, NAME, FATHERNAME)
	VALUES (SEQ_Employer.NEXTVAL, 'Фамилия', 'Имя', 'Отчество', 'Пол', 'Дата рождения', 'Семейное положение', 'Должность');
INSERT INTO t_Employer (ID_Employer, SURNAME, NAME, FATHERNAME)
	VALUES (SEQ_Employer.NEXTVAL, 'Фамилия', 'Имя', 'Отчество', 'Пол', 'Дата рождения', 'Семейное положение', 'Должность');
INSERT INTO t_Employer (ID_Employer, SURNAME, NAME, FATHERNAME)
	VALUES (SEQ_Employer.NEXTVAL, 'Фамилия', 'Имя', 'Отчество', 'Пол', 'Дата рождения', 'Семейное положение', 'Должность');

INSERT INTO t_Group (ID_Group, NAME)
	VALUES (SEQ_Group.NEXTVAL, 'Группа 1');
INSERT INTO t_Group (ID_Group, NAME)
	VALUES (SEQ_Group.NEXTVAL, 'Группа 2');
INSERT INTO t_Group (ID_Group, NAME)
	VALUES (SEQ_Group.NEXTVAL, 'Группа 3');
INSERT INTO t_Group (ID_Group, NAME)
	VALUES (SEQ_Group.NEXTVAL, 'Группа 4');
INSERT INTO t_Group (ID_Group, NAME)
	VALUES (SEQ_Group.NEXTVAL, 'Группа 5');

INSERT INTO t_JOB (ID_JOB, NAME)
	VALUES (SEQ_JOB.NEXTVAL, 'Должность 1');
INSERT INTO t_JOB (ID_JOB, NAME)
	VALUES (SEQ_JOB.NEXTVAL, 'Должность 2');
INSERT INTO t_JOB (ID_JOB, NAME)
	VALUES (SEQ_JOB.NEXTVAL, 'Должность 3');
INSERT INTO t_JOB (ID_JOB, NAME)
	VALUES (SEQ_JOB.NEXTVAL, 'Должность 4');
INSERT INTO t_JOB (ID_JOB, NAME)
	VALUES (SEQ_JOB.NEXTVAL, 'Должность 5');

/*Задание 8*/
DELETE FROM t_inprice 
	WHERE PRICE_DATE < '31.12.2000';

/*Задание 9*/
DELETE FROM t_Messure
	WHERE NAME LIKE '_';

/*Задание 10*/
UPDATE t_Surplus
	SET VOLUME = 0 WHERE ID_Store LIKE 1;

/*Задание 11*/
UPDATE t_Employer
	SET BIRTHDATE = '07.04.1980', MARRIAGE = 'Женат'
	WHERE ID_Employer LIKE 1;

/*Задание 12*/
UPDATE t_caterer
	SET PHONE = 89654123625
	WHERE NAME = 'Поставщик 1';

/*Задание 13*/
UPDATE t_inprice 
	SET PRICE = 0.85 * PRICE
	WHERE PRICE_DATE LIKE '%2017'.
