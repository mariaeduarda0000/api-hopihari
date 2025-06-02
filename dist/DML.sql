INSERT INTO rides (nome, tempo_espera, status, area) VALUES
('Carrossel Encantado', 15, 'Normal', 'ÁREA 1'),
('Roda Gigante Celestial', 32, 'Normal', 'ÁREA 2'),
('Carrinhos de Choque', 34, 'Normal', 'ÁREA 4');

INSERT INTO users (first_name, last_name, email, password, birth_date, phone) VALUES
('Duds', 'Santos', 'dudsMaria@email.com', '$2b$10$nXcS9bEss4Okzwch/phSNOZh2TaLc8XNguvb7X/LZXSCDN68qj576', '2009-06-15', '14999020318'),
('Isa', 'Bela', 'isabela@email.com', '$2b$10$nXcS9bEss4Okzwch/phSNOZh2TaLc8XNguvb7X/LZXSCDN68qj576', '2009-04-28', '14947290293'),
('Lusquinha', 'Santos', 'LuscaSnt@email.com', '$2b$10$nXcS9bEss4Okzwch/phSNOZh2TaLc8XNguvb7X/LZXSCDN68qj576', '2008-12-23', '14996002734');


INSERT INTO lines (id_ride, id_user)
VALUES  (8, 10),
        (8, 11),
        (9, 11),
        (9, 12),
        (10, 10),
        (10, 12);



//parte 2 - fila por brinquedo

//mostra o nome de usuário, brinquedo e os IDs
SELECT users.first_name AS name, 
       rides.nome AS brinquedo,
		`lines`.*
   FROM `lines`
   INNER JOIN users
           ON users.id = `lines`.id_user
	INNER JOIN rides
			ON 	rides.id = `lines`.id_ride
            WHERE rides.area = 'ÁREA 1';



insert into areas (name) 
values 
("Aribabiba"),
("KamindaMundi"),
("WildWest"),
("Infantasia"),
("Mistieri");

INSERT INTO rides (name, waiting_time, status, area)
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

INSERT INTO rides (name, waiting_time, status, area)
VALUES 
('KATAKUMB', 16, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('EKATOMB', 10, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('MONTEZUM', 4, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('SIMULÁKRON', 6, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('VULAVIKING', 5, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('VURANG', 8, 'open', (SELECT id FROM areas WHERE name = 'Mistieri'));

INSERT INTO rides (name, waiting_time, status, area)
VALUES 
('THEATRO DI KAMINDA', 30, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi')),
('GIRANDA MUNDI', 8, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi')),
('JOGAKÍ DI KAMINDA', 10, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi')),
('LE VOYAGE', 15, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi'));

INSERT INTO rides (name, waiting_time, status, area)
VALUES 
('SPEEDI ´64', 5, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('VAMBATÊ', 3, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('CINEMOTION', 7, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('KATAPUL', 1, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('JAMBALAIA', 2, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('ARIBABOBBI', 8, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('PARANGOLÉ', 3, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('HADIKALI', 1, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba'));

INSERT INTO rides (name, waiting_time, status, area)
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


