insert into areas (name) 
values 
("Aribabiba"),
("KamindaMundi"),
("WildWest"),
("Infantasia"),
("Mistieri");

INSERT INTO rides (name, waiting_time, status, id_areas)
VALUES 
('NAMUSKITA', 3, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('LA MINA DEL JOE SACRAMENTO', 4, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('EVOLUTION', 6, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('BRAVO BULL', 11, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('GHOSTI HOTEL', 10, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('RIO BRAVO', 8, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('VAMVOLARI', 5, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('SPLESHI', 5, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('TIROLESA', 5, 'open', (SELECT id FROM areas WHERE name = 'WildWest'));

INSERT INTO rides (name, waiting_time, status, id_areas)
VALUES 
('KATAKUMB', 16, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('EKATOMB', 10, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('MONTEZUM', 4, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('SIMULÁKRON', 6, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('VULAVIKING', 5, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('VURANG', 8, 'open', (SELECT id FROM areas WHERE name = 'Mistieri'));

INSERT INTO rides (name, waiting_time, status, id_areas)
VALUES 
('THEATRO DI KAMINDA', 30, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi')),
('GIRANDA MUNDI', 8, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi')),
('JOGAKÍ DI KAMINDA', 10, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi')),
('LE VOYAGE', 15, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi'));

INSERT INTO rides (name, waiting_time, status, id_areas)
VALUES 
('SPEEDI ´64', 5, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('VAMBATÊ', 3, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('CINEMOTION', 7, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('KATAPUL', 1, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('JAMBALAIA', 2, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('ARIBABOBBI', 8, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('PARANGOLÉ', 3, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('HADIKALI', 1, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba'));

INSERT INTO rides (name, waiting_time, status, id_areas)
VALUES 
('KASTEL DI LENDAS', 12, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('GIRANDA POKOTÓ', 13, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('TOKA DO UGA', 1, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('BUGABALUM', 15, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('GIRALATA', 5, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('DISPENKITO', 2, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('KOMBOIO', 3, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('ASTRONAVI', 6, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('KLAPI KLAPI', 8, 'open', (SELECT id FROM areas WHERE name = 'Infantasia'));

//imagens

SELECT name FROM rides;
update rides set image = "ekatomb.jpg" where name = "EKATOMB";
UPDATE rides SET image = 'aribabobbi.png' WHERE name = 'ARIBABOBBI';
UPDATE rides SET image = 'atronavi.jpg' WHERE name = 'ATRONAVI';
UPDATE rides SET image = 'bugabalum.jpg' WHERE name = 'BUGABALUM';
UPDATE rides SET image = 'dispenkito.jpg' WHERE name = 'DISPENKITO';
UPDATE rides SET image = 'ekatomb.jpg' WHERE name = 'EKATOMB';
UPDATE rides SET image = 'evolution.jpg' WHERE name = 'EVOLUTION';
UPDATE rides SET image = 'giralata.jpg' WHERE name = 'GIRALATA';
UPDATE rides SET image = 'girandaMundi.jpg' WHERE name = 'GIRANDAMUNDI';
UPDATE rides SET image = 'granPalaz.jpg' WHERE name = 'GRANPALAZ';
UPDATE rides SET image = 'hadikali.jpg' WHERE name = 'HADIKALI';
UPDATE rides SET image = 'jogaki.jpg' WHERE name = 'JOGAKI';
UPDATE rides SET image = 'kastel.jpg' WHERE name = 'KASTEL';
UPDATE rides SET image = 'katakumb.jpg' WHERE name = 'KATAKUMB';
UPDATE rides SET image = 'katapul.jpg' WHERE name = 'KATAPUL';
UPDATE rides SET image = 'klapi.jpg' WHERE name = 'KLAPI';
UPDATE rides SET image = 'Le Voyage.jpg' WHERE name = 'LE VOYAGE';
UPDATE rides SET image = 'Montezum.jpg' WHERE name = 'MONTEZUM';
UPDATE rides SET image = 'Parangolé.jpg' WHERE name = 'PARANGOLÉ';
UPDATE rides SET image = 'pokoto.jpg' WHERE name = 'POKOTO';
UPDATE rides SET image = 'Rango-Django.jpg' WHERE name = 'RANGO-DJANGO';
UPDATE rides SET image = 'Rio Bravo.jpg' WHERE name = 'RIO BRAVO';
UPDATE rides SET image = 'saloon.jpg' WHERE name = 'SALOON';
UPDATE rides SET image = 'simlakron.jpg' WHERE name = 'SIMLAKRON';
UPDATE rides SET image = 'spleshi.jpg' WHERE name = 'SPLESHI';
UPDATE rides SET image = 'theatro.jpg' WHERE name = 'THEATRO';
UPDATE rides SET image = 'toka.jpg' WHERE name = 'TOKA';
UPDATE rides SET image = 'vambate.jpg' WHERE name = 'VAMBATE';
UPDATE rides SET image = 'vulaviking.jpg' WHERE name = 'VULAVIKING';
UPDATE rides SET image = 'vurang.jpg' WHERE name = 'VURANG';
UPDATE rides SET image = 'ASTRONAVI.jpg' WHERE name = 'ASTRONAVI';
UPDATE rides SET image = 'BRAVO BULL.jpg' WHERE name = 'BRAVO BULL';
UPDATE rides SET image = 'CINEMOTION.jpg' WHERE name = 'CINEMOTION';
UPDATE rides SET image = 'GHOSTI HOTEL.jpg' WHERE name = 'GHOSTI HOTEL';
UPDATE rides SET image = 'GIRANDA MUNDI.jpg' WHERE name = 'GIRANDA MUNDI';
UPDATE rides SET image = 'GIRANDA POKOTO.jpg' WHERE name = 'GIRANDA POKOTO';
UPDATE rides SET image = 'JAMBALAIA.jpg' WHERE name = 'JAMBALAIA';
UPDATE rides SET image = 'JOGAKI DI KAMINDA.jpg' WHERE name = 'JOGAKI DI KAMINDA';
UPDATE rides SET image = 'KASTEL DI LENDAS.jpg' WHERE name = 'KASTEL DI LENDAS';
UPDATE rides SET image = 'KLAPI KLAPI.jpg' WHERE name = 'KLAPI KLAPI';
UPDATE rides SET image = 'KOMBOIO.jpg' WHERE name = 'KOMBOIO';
UPDATE rides SET image = 'LA MINA DEL JOE SACRAMENTO.jpg' WHERE name = 'LA MINA DEL JOE SACRAMENTO';
UPDATE rides SET image = 'NAMUSKITA.jpg' WHERE name = 'NAMUSKITA';
UPDATE rides SET image = 'SIMULÁKRON.jpg' WHERE name = 'SIMULÁKRON';
UPDATE rides SET image = 'SPEEDI ´64.jpg' WHERE name = 'SPEEDI ´64';
UPDATE rides SET image = 'THEATRO DI KAMINDA.jpg' WHERE name = 'THEATRO DI KAMINDA';
UPDATE rides SET image = 'TIROLESA.jpg' WHERE name = 'TIROLESA';
UPDATE rides SET image = 'TOKA DO UGA.jpg' WHERE name = 'TOKA DO UGA';
UPDATE rides SET image = 'VAMVOLARI.jpg' WHERE name = 'VAMVOLARI';
