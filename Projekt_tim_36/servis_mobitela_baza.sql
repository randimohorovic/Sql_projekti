DROP DATABASE servis_mobitela;
CREATE DATABASE servis_mobitela;
USE servis_mobitela;

CREATE TABLE tvrtka (
        naziv_tvrtke VARCHAR(50) NOT NULL,
		oib CHAR(11) NOT NULL,
		tel_broj INTEGER NOT NULL,
		adresa VARCHAR(50) NOT NULL,
		radno_vrijeme VARCHAR(20) NOT NULL,
		PRIMARY KEY (oib)
		
);

CREATE TABLE servis (
        id INTEGER NOT NULL,										
		naziv VARCHAR(50) NOT NULL,
		PRIMARY KEY (id)
);
                             
CREATE TABLE kupac (
        id INTEGER NOT NULL,
		ime VARCHAR(20) NOT NULL,
		prezime VARCHAR(20) NOT NULL,
		grad VARCHAR(50) NOT NULL,
		PRIMARY KEY (id)
);

CREATE TABLE zaposlenici (
        id INTEGER NOT NULL,
		ime VARCHAR(50) NOT NULL,
		prezime VARCHAR(50) NOT NULL,
		oib CHAR(11) NOT NULL,
		id_posao INTEGER NOT NULL,
        id_servis INTEGER NOT NULL,
		PRIMARY KEY (id)
);


CREATE TABLE usluga (
        id INTEGER NOT NULL,										
		naziv VARCHAR(50) NOT NULL,
        cijena NUMERIC(5,2) NOT NULL,
		PRIMARY KEY (id)
);

CREATE TABLE proizvod (
        id INTEGER NOT NULL,
		naziv VARCHAR(50) NOT NULL,
		cijena_proizvod NUMERIC(10,2) NOT NULL,
		stanje CHAR(2) NOT NULL,
        vrsta_proizvoda INTEGER NOT NULL,
		id_servis INTEGER NOT NULL,
		PRIMARY KEY (id)
);
CREATE TABLE racun (
	id INTEGER NOT NULL,
	id_zaposlenici INTEGER NOT NULL,
	id_kupac INTEGER NOT NULL,
	broj VARCHAR(100) NOT NULL,
	datum_izdavanja DATETIME NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_zaposlenici) REFERENCES zaposlenici (id),
	FOREIGN KEY (id_kupac) REFERENCES kupac (id)
);

CREATE TABLE stavka_racun (
	id INTEGER NOT NULL,
	id_racun INTEGER NOT NULL,
	id_proizvod INTEGER NOT NULL,
    id_usluga INTEGER NOT NULL,
	kolicina INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_racun) REFERENCES racun (id) ON DELETE CASCADE,
	FOREIGN KEY (id_proizvod) REFERENCES proizvod (id),
	UNIQUE (id_racun, id_proizvod)
);

CREATE TABLE dobavljac (
        id INTEGER NOT NULL,
		naziv VARCHAR(50) NOT NULL,
		oib CHAR(11) NOT NULL,
		id_vrsta_proizvoda INTEGER NOT NULL,
		PRIMARY KEY (id)
);



CREATE TABLE dostavljac (
        id INTEGER NOT NULL,
		dob INTEGER NOT NULL,
		vozacka VARCHAR(50) NOT NULL,
		id_vozilo INTEGER NOT NULL,
		id_zaposlenici INTEGER NOT NULL,
		PRIMARY KEY (id)
);
-- id_servis kojem servisu vozilo pripada 
CREATE TABLE vozilo (
        id INTEGER NOT NULL,
		marka VARCHAR(50) NOT NULL,
		registracija DATE NOT NULL,
		servis DATE NOT NULL,
		kilometara INTEGER NOT NULL,
		id_zaposlenici INTEGER NOT NULL,
		id_servis INTEGER NOT NULL,
		PRIMARY KEY (id)
);

CREATE TABLE posao (
        id INTEGER NOT NULL,
		naziv VARCHAR(50) NOT NULL,
		duznost VARCHAR(50) NOT NULL,
		radno_vrijeme VARCHAR(50) NOT NULL,
		opis VARCHAR(100) NOT NULL,
		PRIMARY KEY (id)
);




alter table zaposlenici add FOREIGN KEY (id_posao) REFERENCES posao (id);
alter table zaposlenici add FOREIGN KEY (id_servis) REFERENCES servis (id);


alter table proizvod add FOREIGN KEY (id_servis) REFERENCES servis (id);


alter table dostavljac add FOREIGN KEY (id_vozilo) REFERENCES vozilo (id);
alter table dostavljac add FOREIGN KEY (id_zaposlenici) REFERENCES zaposlenici (id);

alter table vozilo add FOREIGN KEY (id_zaposlenici) REFERENCES zaposlenici (id);
alter table vozilo add FOREIGN KEY (id_servis) REFERENCES servis (id);
--


INSERT INTO tvrtka VALUES ('Servis-mobitela d.o.o', 864753669, 052/508-671,'Kaštanjer 24','8:00-15:00');   

INSERT INTO posao values (1, 'Direktor', 'CEO servisa', '8:00-15:00','Dogovaranje novih poslova, briga o firmi'),
                         (2, 'Voditelj', 'Menađer servisa', '8:00-15:00','Nadziranje radnika, upravljanje Poslovnice servisom'),
                         (3, 'Dostavljac', 'dostava robe', '8:00-15:00','Dostava robe kupcima'), 
                         (4, 'Radnici', 'Rad u poslovnici', '8:00-15:00','Servisiranje mobitela, kontrola proizvoda, slaganje proizvoda');

INSERT INTO servis VALUES (1, 'Servis Mobitela-Šijana'),
                             (2, 'Servis Mobitela-Veruda'),                                                            
                             (3, 'Servis Mobitela-Stoja');

							 
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
                         

INSERT INTO zaposlenici VALUES (1, 'Randi', 'Mohorović',12345678911,1,1),
							   (2,  'Dean', 'Zrinić', 12345679821,4 ,1),
                               (3,  'Marko', 'Boškin', 12345698732,4 ,1),
                               (4,  'Noel', 'Hafizović', 12345679543,4 ,2),
                               (5,  'Klara', 'Matijašić', 1124973576,4 ,2),
                               (6,  'Nina', 'Lipovac', 67512894332, 4, 2),
                               (7,  'Petra', 'Sirotić', 85623778843,4 ,2),
                               (8,  'Antonia', 'Jukić', 24578843621,4 ,3),
                               (9,  'Simona', 'Bibić', 21213466312,4 ,3),
                               (10,  'Sara', 'Legović', 57843188732,4 ,3),
                               (11,  'Antonio', 'Križanac', 12312452756,1 ,3),
                               (12,  'Andrej', 'Plenković', 24576642287, 2,1),
                               (13,  'Sara', 'Preiša', 98774758176, 3, 2),
                               (14,  'Tea', 'Sibić', 22547463154, 1, 3),
                               (15,  'Izabel', 'Božić', 01254784056,2 ,2),
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
                               (29,  'karla', 'Jurman', 12226703283,3 , 1),
                               (30,  'Tomas', 'Senković', 02244574381,1 ,1);
                               
			
INSERT INTO usluga VALUES (1,'Servis Mobitela- popravak stakla', 300),
						 (2,'Servis Mobitela- popravak kamere', 150), 
                         (3,'Servis Mobitela- popravak baterije', 250),
                         (4,'Servis Mobitela- popravak cpu', 250),
                         (5,'Servis Mobitela- popravak dijelova matične ploče', 285);
                      
                          -- zasita stakla
INSERT INTO proizvod VALUES (1, 'Kaljeno staklo-iphone 6', 80.00,'DA',1,1 ), 
							(2, 'Kaljeno staklo-iphone 7', 80.00,'DA',1,1),
                            (3, 'Kaljeno staklo-iphone 8', 80.00,'DA', 1,1),
                            (4, 'Kaljeno staklo-iphone 9', 80.00,'NE',1,1 ),
                            (5, 'Kaljeno staklo-iphone 10', 90.00,'DA',1, 1),
                            (6, 'Kaljeno staklo-iphone 11', 90.57,'DA',1,1 ),
                            (7, 'Kaljeno staklo-iphone 12', 100.50,'DA',1,1 ),
                            (8, 'Kaljeno staklo-iphone 13', 100.30,'NE',1,1 ),
                            (9, 'Kaljeno staklo- Samsung S5', 50.00,'DA',1, 1),
							(10, 'Kaljeno staklo- Samsung S6', 60.00,'DA',1, 1),
							(11, 'Kaljeno staklo- Samsung S7', 70.00,'DA',1,1 ),			
							(12, 'Kaljeno staklo- Samsung S8', 80.58,'DA',1, 1),
							(13, 'Kaljeno staklo- Samsung S9 ', 80.00,'DA',1, 1),
							(14, 'Kaljeno staklo- Samsung S10', 80.70,'DA', 1,1), 
							(15, 'Kaljeno staklo- Samsung S20', 120.00,'DA',1,2 ),
							(16, 'Kaljeno staklo- Samsung S21', 130.07,'DA',1, 2),
							(17, 'Kaljeno staklo- Samsung S22 ', 130.00,'DA',1,2 ),
                            -- nova stakla
							(18, 'Staklo za iphone mobitele', 1500.00,'DA',2, 2),
							(19, 'Staklo za samsung mobitele', 1200.00,'DA',2,2 ),
							(20, 'Staklo za Xiaomi mobitele ', 850.00,'DA',2,2 ),
							(21, 'Staklo za Huawei mobitele', 920.00,'DA',2, 2),
                            -- dijelovi mobitela
							(22, ' Straznja kamera-Iphone 10', 1568.00,'NE',3,3 ) ,   
						    (23, 'Straznja kamera-Iphone 11', 1570.00,'DA', 3,3),
							(24, 'Straznja kamera-Iphone 12', 1580.00,'DA',3,3 ),
							(25, 'Straznja kamera-Samsung S10', 1500.00,'NE',3, 3),
							(26, 'Straznja kamera-Samsung S22', 1550.00,'DA',3, 3),
							(27, 'Straznja kamera-ostali uređaji', 720.00,'DA', 3,3) ,
                            (28, 'Prednja kamera- ostali uređaji', 560.00,'DA',3,3 ),
                            (29, 'CPU-Snapdragon 720 ', 1200.00,'DA', 3,3),
                            (30, 'CPU-A11', 1600.00,'DA', 3,3);
							
							-- Sevis Mobitela-Šijana vozila
INSERT INTO vozilo values (1, 'Mercedes', STR_TO_DATE('15.5.2021.', '%d.%m.%Y.'), STR_TO_DATE('1.5.2021.', '%d.%m.%Y.'), 150000, 16, 1),
                          (2, 'BMW', STR_TO_DATE('26.6.2021.', '%d.%m.%Y.'), STR_TO_DATE('12.5.2022.', '%d.%m.%Y.'), 200000, 17,1),
                          (3, 'Peugeot', STR_TO_DATE('2.5.2021.', '%d.%m.%Y.'), STR_TO_DATE('2.5.2021.', '%d.%m.%Y.'), 100000, 18, 1),
                          (4, 'Fiat', STR_TO_DATE('3.5.2021.', '%d.%m.%Y.'), STR_TO_DATE('24.3.2021.', '%d.%m.%Y.'), 250000, 19, 1),
						  -- Sevis Mobitela-Veruda vozila
                          (5, 'Peugeot', STR_TO_DATE('5.4.2021.', '%d.%m.%Y.'), STR_TO_DATE('24.5.2021.', '%d.%m.%Y.'), 350000, 20, 2),
                          (6, 'BMW', STR_TO_DATE('3.8.2021.', '%d.%m.%Y.'), STR_TO_DATE('12.6.2021.', '%d.%m.%Y.'), 150000, 21, 2),
                          (7, 'Fiat', STR_TO_DATE('7.12.2021.', '%d.%m.%Y.'), STR_TO_DATE('24.5.2021.', '%d.%m.%Y.'), 350000, 22, 2),
                          (8, 'VolksWagen', STR_TO_DATE('6.11.2021.', '%d.%m.%Y.'), STR_TO_DATE('3.5.2021.', '%d.%m.%Y.'),  200000, 23 ,2 ),
                          -- Servis Mobitela-Stoja vozila
                          (9, 'BMW', STR_TO_DATE('4.5.2021.', '%d.%m.%Y.'), STR_TO_DATE('23.6.2021.', '%d.%m.%Y.'), 350000, 24, 3),
                          (10, 'VolksWagen', STR_TO_DATE('5.7.2021.', '%d.%m.%Y.'), STR_TO_DATE('23.3.2021.', '%d.%m.%Y.'), 150000, 25, 3),
                          (11, 'BMW', STR_TO_DATE('3.8.2021.', '%d.%m.%Y.'), STR_TO_DATE('2.6.2021.', '%d.%m.%Y.'),  200000, 26, 3),
                          (12, 'VolksWagen', STR_TO_DATE('3.4.2021.', '%d.%m.%Y.'), STR_TO_DATE('22.4.2021.', '%d.%m.%Y.'), 150000, 27, 3);
                       
	
INSERT INTO dostavljac values (1, 30,'B', 1, 16),
                              (2, 30, 'B', 2, 17),
                              (3, 41, 'B', 3, 18),
                              (4, 25, 'C1', 4, 19),
                              (5, 26, 'B', 5, 20),
                              (6, 27, 'C', 6, 21),
                              (7, 20, 'B' , 7, 22),
                              (8, 23, 'B', 8, 23),
                              (9, 41, 'C', 9, 24),
                              (10, 23, 'B', 10, 25);

-- dobavljaci djelova komponenti
INSERT INTO dobavljac values (1, 'Futura d.o.o',123456789, 1),
                             (2, 'Mobile Parts d.o.o',524789553, 2),
                             (3, 'Exodus d.o.o',427774583, 3);
                             
                             
INSERT INTO racun VALUES (1, 11, 1, '00001', STR_TO_DATE('05.10.2020.', '%d.%m.%Y.')),
						 (2, 12, 2, '00002', STR_TO_DATE('06.10.2020.', '%d.%m.%Y.')),
						 (3, 13, 5, '00003', STR_TO_DATE('07.10.2020.', '%d.%m.%Y.'));

INSERT INTO stavka_racun VALUES (1, 1, 18, 1,1),
                                (2, 1, 3, 1,2),
                                (3, 2, 23, 1,1),
                                (4, 2, 7, 2,1),
                                (5, 3, 29, 4, 1);  
                             
                       
							 
SELECT * FROM tvrtka;
SELECT * FROM posao;
SELECT * FROM servis;
SELECT * FROM dobavljac;
SELECT * FROM dostavljac;
SELECT * FROM vozilo;
SELECT * FROM proizvod;
SELECT * FROM zaposlenici;
SELECT * FROM kupac;
SELECT * FROM racun;
SELECT * FROM stavka_racun;

 -- ////////////////////////////////////////////////////////////////////////////////////////////
-- POGLEDI

-- 1. -pogled  dostavljaca njegovih godina
DROP VIEW  view_dostavljaca_dob;
CREATE VIEW view_dostavljaca_dob AS
SELECT dob from dostavljac
 ORDER BY dob DESC;
SELECT *
 FROM view_dostavljaca_dob as pd;    -- godine dostavljaca poredanih od najstarijeg do najmladeg

-- 2. -pogled_kupac 
DROP VIEW  view_kupaca;
    CREATE VIEW view_kupac AS 
		SELECT * FROM kupac
		WHERE id IN (SELECT id FROM racun)
		ORDER BY ime;
	SELECT * 
    FROM view_kupac; -- prikazuje sve kupce po racunima  poredani po abecednom redu
	
	
-- 3 -pogled svih proizvoda 
DROP VIEW  view_proizvoda;
CREATE VIEW view_proizvoda AS
  SELECT naziv, cijena_proizvod
	FROM proizvod;
		SELECT * 
        FROM view_proizvoda; -- prikazujemo sve proizvode
        
	-- 	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
-- UPITI

-- prikaz jednistvenih prezimena zaposlenika
SELECT DISTINCT prezime
 FROM zaposlenici;
 
-- 1. Prikazuje najjeftiniji  proizvod
SELECT *
FROM proizvod
ORDER BY cijena_proizvod ASC
LIMIT 1;

-- 2. Prikazuje najskupljiji proizvod
SELECT *
FROM proizvod
ORDER BY cijena_proizvod DESC
LIMIT 1;

-- 3. Ispisuje racun gdje je  vise od 1 proizvoda

select p.*
from proizvod as p
where p.id in (select id_proizvod
from stavka_racun
group by id_proizvod
HAVING SUM(kolicina) > 1);

-- 4. -Prikazana su sva vozila marke bmw koji su registrirani zadnjih 12 mjeseci
select * from vozilo
where marka = 'BMW' and registracija > now() - interval 12 month;

-- 5. -Prikaz svih proizvoda koji su nabavljeni od Mobile Parts d.o.o tvrtke
select *
from proizvod 
where vrsta_proizvoda in (SELECT id_vrsta_proizvoda
 FROM dobavljac
 WHERE naziv = 'Mobile Parts d.o.o');
 
-- 6. -Prikaz svih radnika u poslovnici Stoja
select *
from zaposlenici 
where id_posao in (SELECT id FROM posao WHERE duznost = 'Rad u poslovnici' )
and id_servis in(select id FROM servis 
 WHERE naziv = 'Servis Mobitela-Stoja');
 
-- 7. Prikaz zaposlenika koji imaju polozenu vozacku za teretna vozila 
SELECT *
FROM zaposlenici 
WHERE id IN ( SELECT id_zaposlenici FROM dostavljac WHERE vozacka = 'C1' OR vozacka = 'C');

-- 8. Prikaz dostavljaca i njihovih vozil
SELECT *
FROM vozilo AS v, zaposlenici AS z
WHERE v.id_zaposlenici = z.id;

-- 9. Prikaz marka teretnih vozila 
SELECT *
FROM vozilo AS v, zaposlenici AS z
WHERE v.id_zaposlenici = z.id AND 
z.id IN ( SELECT id_zaposlenici FROM dostavljac WHERE vozacka = 'C1' OR vozacka = 'C');

-- 10.  prikaz racuna sa najvecom kolicinom proizvoda 

SELECT *
FROM racun 
WHERE id IN (SELECT id_racun FROM stavka_racun );


SELECT SUM(kolicina)
 FROM stavka_racun
 WHERE id_racun 
 

