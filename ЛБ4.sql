/*Задание 48*/
CREATE VIEW V_caterer
	(ID_caterer, caterer_NAME, Contact_NAME, Contact_SURNAME)
AS
	SELECT t_caterer.ID_caterer, t_caterer.NAME, t_Contact.NAME, t_Contact.SURNAME
		FROM t_caterer JOIN t_Contact
		ON t_caterer.ID_caterer = t_Contact.ID_caterer;

SELECT * FROM V_caterer;

INSERT INTO V_caterer
	(ID_caterer, caterer_NAME, Contact_NAME, Contact_SURNAME)
	VALUES
	(4, 'Поставщик4', 'Имя6', 'Фамилия6');

DELETE FROM V_caterer
	WHERE ID_caterer = 3;

/*Задание 49*/
CREATE OR REPLACE VIEW V_Surplus
	(Material, Store, VOLUME)
AS
	SELECT t_Material.NAME, t_Store.NAME, SUM (t_Surplus.VOLUME)
	FROM t_Material JOIN t_Surplus
	ON t_Material.ID_Material = t_Surplus.ID_Material
	JOIN t_Store
	ON t_Surplus.ID_Store = t_Store.ID_Store
	GROUP BY t_Material.NAME, t_Store.NAME;

/*Задание 50*/
CREATE VIEW V_Supply
	(caterer_NAME, Material, Messure, Supply_Date, PRICE, VOLUME, Summ)
AS
	SELECT t_caterer.NAME, t_Material.NAME, t_Messure.NAME,
		t_Supply.Supply_Date, t_inprice.PRICE,
		t_Supply.VOLUME, t_Supply.VOLUME *t_inprice.PRICE
	FROM t_Supply JOIN t_caterer
	ON t_Supply.ID_caterer = t_caterer.ID_caterer
	JOIN t_Material
	ON t_Supply.ID_Material = t_Material.ID_Material
	JOIN t_Messure
	ON t_Material.ID_Messure = t_Messure.ID_Messure
	JOIN t_inprice
	ON t_Material.ID_Material = t_inprice.ID_Material;

/*Задание 51*/
ALTER TABLE t_Deliver
	ADD VOLUME INT CHECK (VOLUME >= 0);
UPDATE t_Deliver
	SET VOLUME = 10;

CREATE VIEW V_Store
	(Store, Material, Messure, Summ)
AS
	SELECT t_Store.NAME, t_Material.NAME, t_Messure.NAME,
		SUM (t_Deliver.VOLUME)
	FROM t_Deliver JOIN t_Store
	ON t_Deliver.ID_Store = t_Store.ID_Store
	JOIN t_Material
	ON t_Deliver.ID_Material = t_Material.ID_Material
	JOIN t_Messure
	ON t_Material.ID_Messure = t_Messure.ID_Messure
	WHERE Deliver_DATE >= '01.01.2017' 
		AND Deliver_DATE <= '31.12.2017'
	GROUP BY t_Store.NAME, t_Material.NAME, t_Messure.NAME;

/*Задание 52*/
ALTER TABLE t_Supply
	ADD PRICE INT CHECK (PRICE >= 0);
UPDATE t_Supply
	SET PRICE = 100;

CREATE OR REPLACE VIEW V_Supply_PRICE
	(ID, Material, VOLUME, Store, PRICE, Summ)
AS
	SELECT t_Supply.ID_Supply, t_Material.NAME, t_Supply.VOLUME,
		t_Store.NAME, t_Supply.PRICE,
		t_Supply.VOLUME * t_Supply.PRICE
	FROM t_Supply JOIN t_Material
	ON t_Supply.ID_Material = t_Material.ID_Material
	JOIN t_Store
	ON t_Supply.ID_Store = t_Store.ID_Store
	ORDER BY t_Supply.ID_Supply;

CREATE OR REPLACE VIEW V_inprice
	(ID, Material, VOLUME, Store, PRICE, Summ)
AS
	SELECT t_Supply.ID_Supply, t_Material.NAME, t_Supply.VOLUME,
		t_Store.NAME, t_inprice.PRICE,
		t_Supply.VOLUME * t_inprice.PRICE
	FROM t_Supply JOIN t_Material
	ON t_Supply.ID_Material = t_Material.ID_Material
	JOIN t_inprice
	ON t_Material.ID_Material = t_inprice.ID_Material
	JOIN t_Store
	ON t_Supply.ID_Store = t_Store.ID_Store
	ORDER BY t_Supply.ID_Supply;

CREATE VIEW V_Compare
	(Material, VOLUME, Store, Supply_PRICE, inprice, DIFFERENCE)
AS
	SELECT t_Material.NAME, t_Supply.VOLUME, t_Store.NAME,
		V_Supply_PRICE.Summ, V_inprice.Summ,
		ABS (V_Supply_PRICE.Summ - V_inprice.Summ)
	FROM t_Supply JOIN t_Material
	ON t_Supply.ID_Material = t_Material.ID_Material
	JOIN t_Store
	ON t_Supply.ID_Store = t_Store.ID_Store
	JOIN V_Supply_PRICE
	ON t_Supply.ID_Supply = V_Supply_PRICE.ID
	JOIN V_inprice
	ON t_Supply.ID_Supply = V_inprice.ID;


