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
           ON users.id = `lines`.id_users
	INNER JOIN rides
			ON 	rides.id = `lines`.id_rides
            WHERE rides.area = 'ÁREA 1';

