DROP DATABASE skladiste;
CREATE DATABASE skladiste;
USE skladiste;

CREATE TABLE firma (
        naziv_firme VARCHAR(50) NOT NULL,
		OIB BIGINT NOT NULL,
		tel_broj INTEGER NOT NULL,
		adresa VARCHAR(50) NOT NULL,
		radno_vrijeme VARCHAR(20) NOT NULL,
		PRIMARY KEY (naziv_firme)
		
);

CREATE TABLE zaposlenici (
        ID INTEGER NOT NULL,
		ime VARCHAR(50) NOT NULL,
		prezime VARCHAR(50) NOT NULL,
		OIB BIGINT NOT NULL,
		ID_posao INTEGER NOT NULL,
		ID_skladiste INTEGER NOT NULL,
		PRIMARY KEY (ID)
);

CREATE TABLE kupac (
        ID INTEGER NOT NULL,
		ime VARCHAR(20) NOT NULL,
		prezime VARCHAR(20) NOT NULL,
		lokacija VARCHAR(50) NOT NULL,
		PRIMARY KEY (ID)
);

CREATE TABLE narudzba (
        ID INTEGER NOT NULL,
		vrsta_robe VARCHAR(50) NOT NULL,
		kolicina INTEGER NOT NULL,									
		cijena NUMERIC(10,2) NOT NULL,
		ID_skladiste INTEGER NOT NULL,
		ID_proizvod INTEGER NOT NULL,
		ID_kupac INTEGER NOT NULL,
		ID_dostavljac INTEGER NOT NULL,
		PRIMARY KEY (ID)															
); 

CREATE TABLE proizvod (
        ID INTEGER NOT NULL,
		naziv VARCHAR(50) NOT NULL,
		cijena_proizvod NUMERIC(10,2) NOT NULL,
		stanje CHAR(2) NOT NULL,
		ID_skladiste INTEGER NOT NULL,
		PRIMARY KEY (ID)
);

CREATE TABLE dobavljac (
        ID INTEGER NOT NULL,
		naziv VARCHAR(50) NOT NULL,
		OIB BIGINT NOT NULL,
		ID_proizvod INTEGER NOT NULL,
		PRIMARY KEY (ID)
);


CREATE TABLE dostavljac (
        ID INTEGER NOT NULL,
		dob INTEGER NOT NULL,
		vozacka VARCHAR(50) NOT NULL,
		ID_vozilo INTEGER NOT NULL,
		ID_zaposlenici INTEGER NOT NULL,
		PRIMARY KEY (ID)
);

CREATE TABLE vozilo (
        ID INTEGER NOT NULL,
		marka VARCHAR(50) NOT NULL,
		registracija DATE NOT NULL,
		servis DATE NOT NULL,
		kilometara INTEGER NOT NULL,
		ID_zaposlenici INTEGER NOT NULL,
		ID_skladiste INTEGER NOT NULL,
		PRIMARY KEY (ID)
);

CREATE TABLE posao (
        ID INTEGER NOT NULL,
		naziv VARCHAR(50) NOT NULL,
		duznost VARCHAR(50) NOT NULL,
		radno_vrijeme VARCHAR(50) NOT NULL,
		opis VARCHAR(100) NOT NULL,
		PRIMARY KEY (ID)
);


CREATE TABLE skladiste (
        ID INTEGER NOT NULL,										
		vrsta_robe VARCHAR(20) NOT NULL,
		PRIMARY KEY (ID)
);



alter table zaposlenici add FOREIGN KEY (ID_posao) REFERENCES posao (ID);
alter table zaposlenici add FOREIGN KEY (ID_skladiste) REFERENCES skladiste (ID);


alter table narudzba add FOREIGN KEY (ID_skladiste) REFERENCES skladiste (ID);
alter table narudzba add FOREIGN KEY (ID_proizvod) REFERENCES proizvod (ID);
alter table narudzba add FOREIGN KEY (ID_kupac) REFERENCES kupac (ID);
alter table narudzba add FOREIGN KEY (ID_dostavljac) REFERENCES dostavljac (ID);


alter table proizvod add FOREIGN KEY (ID_skladiste) REFERENCES skladiste (ID);



alter table dobavljac add FOREIGN KEY (ID_proizvod) REFERENCES proizvod (ID);

alter table dostavljac add FOREIGN KEY (ID_vozilo) REFERENCES vozilo (ID);
alter table dostavljac add FOREIGN KEY (ID_zaposlenici) REFERENCES zaposlenici (ID);


alter table vozilo add FOREIGN KEY (ID_zaposlenici) REFERENCES zaposlenici (ID);
alter table vozilo add FOREIGN KEY (ID_skladiste) REFERENCES skladiste (ID);
--


INSERT INTO firma VALUES ('Prodaja d.o.o', 14752004911, 0985477453,'Stankovićeva 31','8:00-16:00');   

INSERT INTO posao values (1, 'Direktor', 'Vođenje firme', '8:00-16:00','Dogovaranje novih poslova, briga o firmi'),
                         (2, 'Voditelj', 'Vođenje skladišta', '8:00-16:00','Nadziranje radnika, upravljanje skladištem'),
                         (3, 'Dostavljac', 'dostava robe', '8:00-16:00','Dostava robe kupcima'), 
                         (4, 'Radnici', 'priprema robe', '8:00-16:00','Priprema robe za dostavu, kontrola robe, spremanje robe');


INSERT INTO skladiste VALUES (1, 'Gazirano piće'),
                             (2, ' Alkohol '),                                                            
                             (3, ' Grickalice');
							 
INSERT INTO kupac VALUES (1, 'Noel', 'Zikarovič','Pula'), 
					     (2,  'Daniel', 'Lukić', 'Zagreb'),
                         (3,  'Sebastian', 'Sponza', 'Zagreb'),
                         (4,  'Tea', 'Sirotić', 'Pula'),
                         (5,  'Klara', 'Zakirović', 'Osijek'),
                         (6,  'Alesija', 'Dušić', 'Zagreb'),
                         (7,  'Dino', 'Petrović', 'Pula'),
                         (8,  'Larissa', 'Boljunić', 'Zagreb'),
                         (9,  'Enia', 'Kunić', 'Rovinj'),
                         (10,  'Teo', 'Legović', 'Pula'),
                         (11,  'Patrik', 'Zahimirović', 'Poreč'),
                         (12,  'Patrik', 'Žilić', 'Pula'),
                         (13,  'Sara', 'Sansa', 'Karlovac'),
                         (14,  'Eni', 'Hodžajev', 'Poreč'),
                         (15,  'Damir', 'Linard', 'Ogulin'),
                         (16,  'Daira', 'Kukac', 'Pazin'),
                         (17,  'Samanta', 'Barić', 'Zagreb'),
                         (18,  'Luka', 'Košnjać', 'Karlovac'),
                         (19,   'Vesna', 'Garić', 'Rijeka'),
                         (20,  'Miorad', 'Mirković', 'Rijeka'),
                         (21,  'Luka', 'Krelj', 'Zagreb'),
                         (22,  'Andrej', 'Zahirović', 'Rovinj'),
                         (23,  'Nolan', 'Runovac', 'Pazin'),
                         (24,  'Tomas', 'Ajder', 'Rijeka'),
                         (25,  'Božo', 'Trpić', 'Pula'),
                         (26,  'Marko', 'Budimir', 'Zagreb'),
                         (27,  'Filip', 'Filipović', 'Pula'),
                         (28,  'Petar', 'Preradović', 'Rovinj'),
                         (29,  'Jakov', 'Jurman', 'Poreč'),
                         (30,  'Tomas', 'Tomažin', 'Pazin');

INSERT INTO zaposlenici VALUES (1, 'Randi', 'Mihajlović',12345678911,1,1),
							   (2,  'Dean', 'Zrinić', 12345679821,4 ,1),
                               (3,  'Marko', 'Boškin', 12345698732,4 ,1),
                               (4,  'Noel', 'Hafizović', 12345679543,4 ,2),
                               (5,  'Klara', 'Matijašić', 1124973576,4 ,2),
                               (6,  'Nina', 'Lipovac', 67512894332, 4, 2),
                               (7,  'Petra', 'Sirotić', 85623778843,4 ,2),
                               (8,  'Antonia', 'Jukić', 24578843621,4 ,3),
                               (9,  'Simona', 'Bibić', 21213466312,4 ,3),
                               (10,  'Sara', 'Legović', 57843188732,4 ,3),
                               (11,  'Antonio', 'Križanac', 12312452756,4 ,3),
                               (12,  'Patrik', 'Bukovac', 24576642287, 4,1),
                               (13,  'Sara', 'Preiša', 98774758176, 4, 2),
                               (14,  'Tea', 'Sibić', 22547463154, 4, 3),
                               (15,  'Izabel', 'Božić', 01254784056,4 ,2),
                               (16,  'Daira', 'Zubac', 03467224044, 3, 1),
                               (17,  'Leonarda', 'Merić', 34600572923,3 ,1),
                               (18,  'Megan', 'Racetin', 77854102955, 3, 1),
                               (19,   'Vesna', 'Lončar', 77874962044,3 , 1),
                               (20,  'Marko', 'Mirković', 78799632587,3 ,2),
                               (21,  'Sandra', 'Baban', 88541298099, 3, 2),
                               (22,  'Lucia', 'Maletić', 87954698098,3 ,2),
                               (23,  'Andrej', 'Ivanovski', 83791480601,3 ,3),
                               (24,  'Nensi', 'Modrušan', 99745200710,3 , 3),
                               (25,  'Almira', 'Trbić', 97066589534, 3, 3),
                               (26,  'Ivan', 'Budimir', 45697022431, 2, 1),
                               (27,  'Leonard', 'Filipović', 44875230330,2 ,2),
                               (28,  'Linda', 'Hafizović', 58267102107, 2, 3),
                               (29,  'karla', 'Jurman', 12226703283,4 , 1),
                               (30,  'Tomas', 'Senković', 02244574381,4 ,1);
							   
INSERT INTO proizvod VALUES (1, 'Coca-cola', 11.00,'DA',1 ), 
							(2, 'Pepsi', 12.00,'DA', 1),
                            (3, 'Fanta', 10.00,'DA', 1),
                            (4, 'Limunada', 7.00,'DA',1 ),
                            (5, '7-UP', 11.00,'DA', 1),
                            (6, 'Coca-cola Zero', 11.57,'DA',1 ),
                            (7, 'Cockta Zero', 10.50,'DA',1 ),
                            (8, 'Cockta', 12.30,'DA',1 ),
                            (9, 'Tonic', 13.00,'DA', 1),
							(10, 'Limona', 6.00,'DA', 1),
							(11, 'Orangina', 13.00,'DA',1 ),			
							(12, 'Pepsi lime', 12.58,'DA', 1),
							(13, 'Pipi naranča', 18.00,'DA', 1),
							(14, 'San pelegrino', 8.70,'DA', 1), 
							(15, 'Jegger', 120.00,'DA',2 ),
							(16, 'Vodka', 130.07,'DA', 2),
							(17, 'Jack Daniels', 240.00,'DA',2 ),
							(18, 'Bacardi', 320.00,'DA', 2),
							(19, 'Crno vino', 122.00,'DA',2 ),
							(20, 'Bijelo vino', 112.00,'DA',2 ),
							(21, 'Vino Rose', 89.00,'DA', 2),
							(22, 'Don perignon Šampanjac', 1568.00,'DA',2 ) ,   
						    (23, 'Chio čips', 11.00,'DA', 3),
							(24, 'Chio tortilja čips', 11.00,'DA',3 ),
							(25, 'Kikiriki slani', 11.00,'DA', 3),
							(26, 'Pik&go snack', 11.00,'DA', 3),
							(27, 'Čips paprika', 11.00,'DA', 3) ,
                            (28, 'Chio slani', 11.00,'DA',3 ),
                            (29, 'chio bacon čips', 11.00,'DA', 3),
                            (30, 'Krekeri', 11.00,'DA', 3);
							
INSERT INTO vozilo values (1, 'Mercedes', STR_TO_DATE('15.5.2021.', '%d.%m.%Y.'), STR_TO_DATE('1.5.2021.', '%d.%m.%Y.'), 150000, 16, 1),
                          (2, 'Mercedes', STR_TO_DATE('26.6.2021.', '%d.%m.%Y.'), STR_TO_DATE('23.4.2021.', '%d.%m.%Y.'), 200000, 17,1),
                          (3, 'Fiat', STR_TO_DATE('2.5.2021.', '%d.%m.%Y.'), STR_TO_DATE('2.5.2021.', '%d.%m.%Y.'), 100000, 18, 1),
                          (4, 'Mercedes', STR_TO_DATE('3.5.2021.', '%d.%m.%Y.'), STR_TO_DATE('24.3.2021.', '%d.%m.%Y.'), 250000, 19, 1),
                          (5, 'VolksWagen', STR_TO_DATE('5.4.2021.', '%d.%m.%Y.'), STR_TO_DATE('24.5.2021.', '%d.%m.%Y.'), 350000, 20, 2),
                          (6, 'Mercedes', STR_TO_DATE('3.8.2021.', '%d.%m.%Y.'), STR_TO_DATE('12.6.2021.', '%d.%m.%Y.'), 150000, 21, 2),
                          (7, 'Fiat', STR_TO_DATE('7.12.2021.', '%d.%m.%Y.'), STR_TO_DATE('24.5.2021.', '%d.%m.%Y.'), 350000, 22, 2),
                          (8, 'Mercedes', STR_TO_DATE('6.11.2021.', '%d.%m.%Y.'), STR_TO_DATE('3.5.2021.', '%d.%m.%Y.'),  200000, 23 ,3 ),
                          (9, 'Fiat', STR_TO_DATE('4.5.2021.', '%d.%m.%Y.'), STR_TO_DATE('23.6.2021.', '%d.%m.%Y.'), 350000, 24, 3),
                          (10, 'VolksWagen', STR_TO_DATE('5.7.2021.', '%d.%m.%Y.'), STR_TO_DATE('23.3.2021.', '%d.%m.%Y.'), 150000, 25, 3),
                          (11, 'Mercedes', STR_TO_DATE('3.8.2021.', '%d.%m.%Y.'), STR_TO_DATE('2.6.2021.', '%d.%m.%Y.'),  200000, 26, 1),
                          (12, 'Mercedes', STR_TO_DATE('3.4.2021.', '%d.%m.%Y.'), STR_TO_DATE('22.4.2021.', '%d.%m.%Y.'), 150000, 27, 2),
                          (13, 'VolksWagen', STR_TO_DATE('4.4.2021.', '%d.%m.%Y.'), STR_TO_DATE('22.5.2021.', '%d.%m.%Y.'), 350000,28, 3),
                          (14, 'Mercedes', STR_TO_DATE('6.5.2021.', '%d.%m.%Y.'), STR_TO_DATE('11.5.2021.', '%d.%m.%Y.'), 50000, 1, 1);  
							 
INSERT INTO dostavljac values (1, 24,'C1', 1, 16),
                              (2, 26, 'C', 2, 17),
                              (3, 30, 'C', 3, 18),
                              (4, 36, 'C1', 4, 19),
                              (5, 40, 'C1', 5, 20),
                              (6, 25, 'C1', 6, 21),
                              (7, 24, 'C' , 7, 22),
                              (8, 23, 'C1', 8, 23),
                              (9, 34, 'C', 9, 24),
                              (10, 34, 'C', 10, 25);

INSERT INTO narudzba VALUES (1, 'Gazirano piće', 1,11.00,1,1,1,1),
							(2, 'Gazirano piće', 3,33.00,1,1,2,1) ,
                            (3, 'Gazirano piće', 5,55.00,1,1,3,1),          
							(4, 'Gazirano piće', 3,33.00,1,1,4,2) ,
                            (5, 'Gazirano piće', 6,66.00,1,5,5,2),
							(6, 'Gazirano piće', 2,26.00,1,9,6,2) ,
                            (7, 'Gazirano piće', 3,18.00,1,10,7,3),
							(8, 'Gazirano piće', 1,11.00,1,1,8,3) ,
                            (9, 'Gazirano piće', 5,50.00,1,3,9,3),
							(10, 'Gazirano piće', 1,12.30,1,8,10,4), 
                            (11, 'Alkohol', 7,840.00,2,15,11,4),
							(12, 'Alkohol', 6,780.42,2,16,12,4) ,
                            (13, 'Alkohol', 4,960.00,2,17,13,5),
							(14, 'Alkohol', 8,712.00,2,21,14,5), 
							(15, 'Alkohol', 12,3840.00,2,18,15,5) ,
                            (16, 'Alkohol', 3,4704.00,2,22,16,6),
							(17, 'Alkohol', 5,610.00,2,19,17,6) ,
                            (18, 'Alkohol', 4,448.00,2,20,18,6),
							(19, 'Alkohol', 3,360.00,2,15,19,7) ,
                            (20, 'Alkohol', 14,3360.00,2,17,20,7),
							(21, 'Grickalice', 3,33.00,3,23,21,7) ,
							(22, 'Grickalice', 4,44.00,3,25,22,8) ,
                            (23, 'Grickalice', 3,33.00,3,26,23,8),
							(24, 'Grickalice', 1,11.00,3,27,24,8) ,
                            (25, 'Grickalice', 2,22.00,3,28,25,9),
							(26, 'Grickalice', 3,33.00,3,29,26,9) ,
                            (27, 'Grickalice', 7,77.00,3,30,27,9),
							(28, 'Grickalice', 4,44.00,3,28,28,10) ,
                            (29, 'Grickalice', 3,33.00,3,24,29,10),
							(30, 'Grickalice', 1,11.00,3,30,30,10);

INSERT INTO dobavljac values (1, 'Marin d.o.o.',24567848935, 1),
                             (2, 'Marin d.o.o.',24567848935, 2),
                             (3, 'Marin d.o.o.',24567848935, 3), 
                             (4, 'Marin d.o.o.',24567848935, 4),
                             (5, 'Marin d.o.o ',24567848935, 5),
                             (6, 'Marin d.o.o.',24567848935, 6),
                             (7, 'Marin d.o.o.',24567848935, 7),
                             (8, 'Marin d.o.o.',24567848935, 8),
                             (9, 'Marin d.o.o.',24567848935, 9),
                             (10, 'Marin d.o.o.',24567848935,10 ),
                             (11, 'Marin d.o.o.',24567848935, 11),
                             (12, 'Marin d.o.o.',24567848935, 12),
                             (13, 'Marin d.o.o.',24567848935, 13),
                             (14, 'Marin d.o.o.',24567848935, 14),
                             (15, 'Maxi d.o.o.',98634246855, 15),
                             (16, 'Maxi d.o.o.',98634246855, 16),
                             (17, 'Maxi d.o.o.',98634246855, 17),
                             (18, 'Maxi d.o.o.',98634246855, 18),
                             (19, 'Maxi d.o.o.',98634246855, 19),
                             (20, 'Maxi d.o.o.',98634246855, 20),
                             (21, 'Maxi d.o.o.',98634246855, 21),
                             (22, 'Maxi d.o.o.',98634246855, 22), 
                             (23, 'Tin d.o.o.',35456477682, 23),
                             (24, 'Tin d.o.o.',35456477682, 24),
                             (25, 'Tin d.o.o.',35456477682, 25),
                             (26, 'Tin d.o.o.',35456477682, 26),
                             (27, 'Tin d.o.o.',35456477682, 27),
                             (28, 'Tin d.o.o.',35456477682, 28),
                             (29, 'Tin d.o.o.',35456477682, 29),
                             (30, 'Tin d.o.o.',35456477682, 30);
							 
SELECT * FROM firma;
SELECT * FROM posao;
SELECT * FROM skladiste;
SELECT * FROM dobavljac;
SELECT * FROM dostavljac;
SELECT * FROM narudzba;
SELECT * FROM vozilo;
SELECT * FROM proizvod;
SELECT * FROM zaposlenici;
SELECT * FROM kupac;

--PROCEDURE

--1. - min i max cijene proizvoda
DELIMITER //
CREATE PROCEDURE cijena_proizvoda(OUT min_cijena DECIMAL(10,2), OUT max_cijena DECIMAL(10, 2))
BEGIN
 DECLARE cur CURSOR FOR
 SELECT MIN(cijena_proizvod), MAX(cijena_proizvod) FROM proizvod;

 OPEN CUR;
 FETCH cur INTO min_cijena, max_cijena;
 CLOSE cur;

END //
DELIMITER ;
CALL cijena_proizvoda(@min_cijena, @max_cijena);
SELECT @min_cijena, @max_cijena FROM DUAL;


-- 2. -unos kupca
DELIMITER //
CREATE PROCEDURE unos_kupca (IN p_ID INTEGER, IN p_ime VARCHAR(20), IN p_prezime VARCHAR(20), IN p_lokacija VARCHAR(50))
BEGIN
	
   INSERT INTO kupac VALUES (p_ID, p_ime, p_prezime, p_lokacija);
   
END //
DELIMITER ;
CALL unos_kupca(31, 'Ana', 'Anić', 'Poreč');
CALL unos_kupca(32, 'Leana', 'Buršić', 'Zagreb');
CALL unos_kupca(33, 'Lina', 'Burić', 'Poreč');	
CALL unos_kupca	(34, 'Zdenko', 'Tadić', 'Zagreb');
CALL unos_kupca	(35, 'Matijas', 'Houdek', 'Pula');
CALL unos_kupca	(36, 'Karlo', 'Burić', 'Pula');
CALL unos_kupca	(37, 'Stjepan', 'Živko', 'Rijeka');
CALL unos_kupca	(38, 'Tomislav', 'Martinović', 'Zagreb');
CALL unos_kupca	(39, 'Josip', 'Ciklić', 'Rijeka');
CALL unos_kupca	(40, 'Bruno', 'Antunović','Pula');


-- 3. -unos_proizvoda
DELIMITER //
CREATE PROCEDURE unos_proizvoda (IN p_ID INTEGER,IN p_naziv VARCHAR(50),
IN p_cijena_proizvod NUMERIC(10,2), IN p_stanje CHAR(2),IN p_ID_skladiste INTEGER)
BEGIN
   INSERT INTO proizvod VALUES (p_ID, p_naziv, p_cijena_proizvod, p_stanje, p_ID_skladiste);
END //
DELIMITER ;
CALL unos_proizvoda(31, 'Iso-sport', 9.00, 'DA', 1);
CALL unos_proizvoda(32, 'Malibu', 115.00, 'DA', 2);
CALL unos_proizvoda(33, 'Pringles', 15.00, 'DA', 3);
CALL unos_proizvoda(34, 'Šljivovica', 75.00, 'DA', 2);
CALL unos_proizvoda(35, 'Viljamovka', 99.00, 'DA', 2);


-- 4 -unos_narudzbe
DELIMITER //
CREATE PROCEDURE unos_narudzbe (IN p_ID INTEGER, IN p_vrsta_robe VARCHAR(50), IN p_kolicina INTEGER, 
IN p_cijena NUMERIC(10,2), IN p_ID_skladiste INTEGER, IN p_ID_proizvod INTEGER, IN p_ID_kupac INTEGER, IN p_ID_dostavljac INTEGER)
BEGIN
   INSERT INTO narudzba VALUES (p_ID, p_vrsta_robe, p_kolicina, p_cijena, p_ID_skladiste, p_ID_proizvod, p_ID_kupac, p_ID_dostavljac);
END //
DELIMITER ;
CALL unos_narudzbe(31,'Gazirano piće', 2,18.00,1,31,1,1);
CALL unos_narudzbe(32,'Alkohol',1,115.00,2,32,2,1);
CALL unos_narudzbe(33,'Grickalice',3,45.00,3,33,3,2);
CALL unos_narudzbe(34,'Alkohol',1,75.00,2,34,4,2);
CALL unos_narudzbe(35,'Alkohol',1,99.00,2,35,5,3);


-- 5. - akcije
DELIMITER //
CREATE PROCEDURE akcija (OUT akcijska_cijena DECIMAL(10,2))
BEGIN
    SELECT * ,10/cijena_proizvod AS akcijska_cijena
    FROM proizvod;
END//
DELIMITER ;
CALL akcija(@akcijska_cijena);
SELECT @akcijska_cijena FROM DUAL;

-- POGLEDI

-- 1. -pogled_kupac - prikazuje sve kupce poredani po abecednom redu
    CREATE VIEW pogled_kupac AS 
		SELECT * FROM kupac
		WHERE ID IN (SELECT ID_kupac FROM narudzba)
		ORDER BY ime;
	SELECT * FROM pogled_kupac;
	
	
-- 2 -pogled proizvoda
CREATE VIEW pogled_proizvoda AS
  SELECT naziv, cijena_proizvod
	FROM proizvod;
		SELECT * FROM pogled_proizvoda;
		
-- 3. -pogled akcija
CREATE VIEW pogled_akcija AS 
 SELECT naziv, 10/cijena_proizvod AS akcijska_cijena
    FROM proizvod; 
		SELECT * FROM pogled_akcija;
		
		
-- 4. -pogled_registracije 
	CREATE VIEW datum_registracije AS
		SELECT registracija FROM vozilo
		ORDER BY registracija ASC;
	SELECT * FROM datum_registracije;
		
	
-- 5. -pogled dobi dostavljaca
CREATE VIEW pogled_dobi_dostavljaca AS
SELECT dob from dostavljac ORDER BY dob DESC;
SELECT * FROM pogled_dobi_dostavljaca;
	
	
		
--FUNKCIJE
--1. - vraća broj proizvoda

DELIMITER //
CREATE FUNCTION broj_proizvoda() RETURNS INTEGER
DETERMINISTIC
BEGIN
DECLARE  rez INTEGER DEFAULT 0;

SELECT COUNT(*) INTO rez
FROM proizvod;

RETURN rez;
END//
DELIMITER;
SELECT broj_proizvoda() from DUAL;


-- 1. TRANSAKCIJA -kod unosa novog zaposlenika oib nesmije biti identičan
DELIMITER //
CREATE PROCEDURE unos_novog_zaposlenika(p_id INTEGER, p_ime VARCHAR(20), p_prezime VARCHAR(20),p_oib CHAR(9),p_id_posao INTEGER, p_id_skladiste INTEGER )
BEGIN
 DECLARE EXIT HANDLER FOR 1062
 BEGIN
 ROLLBACK;
 SELECT CONCAT('Nemoguć unos zaposlenika, već postoji');
 END;

 SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
 START TRANSACTION;

 INSERT INTO zaposlenici VALUES (p_ID, p_ime, p_prezime, p_OIB, p_ID_posao , p_ID_skladiste  );
 COMMIT;
END //
DELIMITER ;
SELECT ID,OIB FROM zaposlenici;
CALL unos_novog_zaposlenika(31, 'Noel', 'Hafizović', '123456795', 1, 1);

-- OKIDACI

-- 1. TRIGGER -da se naziv firme ne može mijenjati
DELIMITER //
CREATE TRIGGER bu_firma
 BEFORE UPDATE ON firma
 FOR EACH ROW
	BEGIN
	 SET new.naziv_firme = old.naziv_firme;
	END//
DELIMITER ;


-- 2. TRIGGER -kod unosa novog proizvoda cijena ne moze biti veca od max cijene
DELIMITER //
CREATE TRIGGER zr_cijena
 BEFORE INSERT ON proizvod
 FOR EACH ROW 
	BEGIN
	 DECLARE max_cijena DECIMAL(10, 2);
	 SELECT MAX(cijena_proizvod) INTO max_cijena
	 FROM proizvod;

	 IF new.cijena_proizvod > max_cijena THEN
	 SIGNAL SQLSTATE '40000'
	 SET MESSAGE_TEXT = 'Cijena novog proizvoda ne može biti veća od najskupljega!';
		ELSE
			SET new.cijena_proizvod = new.cijena_proizvod;
	 END IF;
	END//
DELIMITER ;
INSERT INTO proizvod VALUES (55, 'Brandy', 277.00,'DA',2);
INSERT INTO proizvod VALUES (57, 'Vutra', 747.00,'DA',2);
SELECT * FROM proizvod;


-- 3. TRIGGER -cijena manja od 0, stavlja se min cijena
DELIMITER //
CREATE TRIGGER tr_cijena
 BEFORE INSERT ON proizvod
 FOR EACH ROW
	BEGIN
	DECLARE min_cijena DECIMAL(10, 2);
    
	 SELECT MIN(cijena_proizvod) INTO min_cijena
	 FROM proizvod;
     
	 IF new.cijena_proizvod < 0 THEN
	 SET new.cijena_proizvod = min_cijena;
	 END IF;
	END//
DELIMITER ;
INSERT INTO proizvod VALUES (111, 'Southern Comfort', -6.59,'DA',2);
SELECT * FROM proizvod;


-- 4. TRIGGER -onemogućena je negativna količina
DELIMITER //
CREATE TRIGGER bi_proizvod
 BEFORE INSERT ON proizvod
 FOR EACH ROW
BEGIN
 IF new.cijena_proizvod < 0 THEN
    SET new.cijena_proizvod = 1;
 END IF;
END//
DELIMITER ;
INSERT INTO proizvod VALUES(1110, 'Hidra', -14.00, 'DA', 1);
INSERT INTO proizvod VALUES(1000, 'Kokice', -3.50, 'DA', 3);

-- UPITI

-- 1. Ispisuje proizvode iz narudzbe gdje je u narudzbi vise od 8 proizvoda

select p.*
from proizvod as p
where p.id in (select id_proizvod
from narudzba
group by id_proizvod
HAVING SUM(kolicina) > 8);

-- 2. -Prikazana su sva vozila marke mercedes koja su bila na servisu u zadnjih 8 mjeseci
select * from vozilo
where marka = 'Mercedes' and servis > now() - interval 8 month;

-- 3. Prikazuje najskupljiji proizvod

SELECT *
FROM proizvod
ORDER BY cijena_proizvod DESC
LIMIT 1;

-- 4. Upit koji prikazuje 3 volila najblize servisu

SELECT marka, servis, kilometara
FROM vozilo
ORDER BY servis ASC
LIMIT 3 ;

-- 5. Upit koji prikazuje najjeftiniji alkohol

SELECT *
FROM proizvod
WHERE ID_skladiste = 2
ORDER BY cijena_proizvod ASC
LIMIT 1;

