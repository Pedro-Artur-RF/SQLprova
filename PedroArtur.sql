CREATE DATABASE main_db;
USE main_db;


#Criando o input de dados, usuario, uniforme, comida, bebidas, jogos e ingressos. 
CREATE TABLE users_tb(
	user_id CHAR(7) AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL,
    user_f_nm VARCHAR(20),
    user_l_nm VARCHAR(20),
    user_email VARCHAR(40)
);

create table uniform_tb(
	uniform_id CHAR(7) PRIMARY KEY NOT NULL,
    uniform_country CHAR(56) UNIQUE NOT NULL
);

create table player_tb(
	player_id CHAR(7) PRIMARY KEY NOT NULL,
    player_country CHAR(56) NOT NULL,
    playyer_nm char(50) NOT NULL
);

create table food_tb(
	food_id char(7) PRIMARY KEY NOT NULL UNIQUE,
    food_price FLOAT NOT NULL,
    food_nm char(20) NOT NULL
);

create table drinks_tb(
	drink_id char(7) PRIMARY KEY NOT NULL UNIQUE,
    drink_price FLOAT NOT NULL,
    drink_nm char(20) NOT NULL
);

create table matches_tb(
	match_id char(7) PRIMARY KEY NOT NULL UNIQUE,
    match_name varchar(115) NOT NULL UNIQUE,
    match_date DATE NOT NULL
);

create table tickets_tb(
	ticket_id char(10) PRIMARY KEY NOT NULL UNIQUE,
    match_ticket VARCHAR(115) NOT NULL,
    ticket_price FLOAT NOT NULL,
    foreign key (match_ticket) REFERENCES matches_tb(match_name)
);

#Criando a tabela de compra (Entidade associativia)

create table purchases_tb(
	pruchase_id char(7) PRIMARY KEY NOT NULL UNIQUE,
    id_user CHAR(6) NOT NULL,
    foreign key (id_user) references users_tb(user_id),
    id_food CHAR(6) NOT NULL,
    foreign key (id_food) references food_tb(food_id),
    id_drink CHAR(6) NOT NULL,
    foreign key (id_drink) references drinks_tb(drink_id),
    id_ticket CHAR(6) NOT NULL,
    foreign key (id_ticket) references tickets_tb(ticket_id),
    t_price FLOAT NOT NULL
);

#Criando a tabela da votação (Entidade associativia)

create table uniform_vote_pool_tb(
	vote_id char(5) PRIMARY KEY NOT NULL UNIQUE,
    id_uniform char(7) NOT NULL,
    foreign key (id_uniform) references uniform_tb(uniform_id),
    id_user char(7) NOT NULL,
    foreign key (id_user) references users_tb(user_id)
);

#Criando a tabela da votação (jogador) [entidade associativa²]
create table player_vote_pool_tb(
	vote_id char(5) PRIMARY KEY NOT NULL UNIQUE,
    id_player char(7) NOT NULL,
    foreign key (id_player) references player_tb(player_id),
    id_user char(7) NOT NULL,
    foreign key (id_user) references users_tb(user_id)
);

# --------------------------- Colocando Dados ------------------------------------------------

# Tabela users
INSERT INTO users_tb (user_id, user_f_nm, user_l_nm, user_email) VALUES ('1', 'Ana', 'Silva', 'ana.silva@gmail.com'), ('2', 'Bruno', 'Costa', 'bruno.costa@hotmail.com'), ('3', 'Carlos', 'Santos', 'carlos.santos@yahoo.com'), ('4', 'Daniela', 'Oliveira', 'daniela.oliveira@outlook.com'), ('5', 'Eduardo', 'Souza', 'eduardo.souza@msn.com'), ('6', 'Fernanda', 'Lima', 'fernanda.lima@uol.com.br'), ('7', 'Gustavo', 'Alves', 'gustavo.alves@bol.com.br'), ('8', 'Helena', 'Ribeiro', 'helena.ribeiro@terra.com.br'), ('9', 'Igor', 'Martins', 'igor.martins@globo.com'), ('10', 'Juliana', 'Rocha', 'juliana.rocha@zoho.com');
# Tabela Unifomes e países
INSERT INTO uniform_tb (uniform_id, uniform_country) VALUES ('1', 'Brasil'), ('2', 'Argentina'), ('3', 'França'), ('4', 'Alemanha'), ('5', 'Japão'), ('6', 'Estados Unidos'), ('7', 'Canadá'), ('8', 'Austrália'), ('9', 'China'), ('10', 'Índia');
# Tabela Comidas
INSERT INTO food_tb (food_id, food_price, food_nm) VALUES ('1', 12.50, 'Pizza'), ('2', 8.00, 'Hambúrguer'), ('3', 5.00, 'Coxinha'), ('4', 15.00, 'Sushi'), ('5', 10.00, 'Salada');
# Tabela Bebidas
INSERT INTO drinks_tb (drink_id, drink_price, drink_nm) VALUES ('1', 3.00, 'Água'), ('2', 4.50, 'Refrigerante'), ('3', 6.00, 'Suco'), ('4', 8.00, 'Café'), ('5', 10.00, 'Cerveja');
# Tabela de partidas
INSERT INTO matches_tb (match_id, match_name, match_date) VALUES ('1', 'Brasil x Argentina', '2023-08-15'), ('2', 'França x Alemanha', '2023-08-16'), ('3', 'Japão x Estados Unidos', '2023-08-17'), ('4', 'Canadá x Austrália', '2023-08-18'), ('5', 'China x Índia', '2023-08-19');
# Tabela de ingressos para a partidas
INSERT INTO tickets_tb (ticket_id, match_ticket, ticket_price) VALUES ('1', 'Brasil x Argentina', 50.00), ('2', 'França x Alemanha', 60.00), ('3', 'Japão x Estados Unidos', 40.00), ('4', 'Canadá x Austrália', 30.00), ('5', 'China x Índia', 20.00);
# Tabela de compra dos usuários
INSERT INTO purchases_tb (pruchase_id, id_user, id_food, id_drink, id_ticket, t_price) VALUES ('1', '1', '1', '2', '1', 70.50), ('2', '2', '2', '3', '2', 74.50), ('3', '3', '3', '4', '3', 51.00), ('4', '4', '4', '5', '4', 63.00), ('5', '5', '5', '1', '5', 43.00);
# Tabelas da votação 
INSERT INTO uniform_vote_pool_tb (vote_id, id_uniform, id_user) VALUES ('1', '1', '1'), ('2', '2', '2'), ('3', '3', '3'), ('4', '2', '4'), ('5', '3', '5'), ('6', '2', '6'), ('7', '2', '7'), ('8', '2', '8'), ('9', '2', '9'), ('10', '5', '10');
#tabela players
INSERT INTO player_tb (player_id, player_country, playyer_nm) VALUES 
('CHN001', 'China', 'Yao Ming'),
('AUS002', 'Austrália', 'Ash Barty'),
('CAN003', 'Canadá', 'Sidney Crosby'),
('USA004', 'Estados Unidos', 'LeBron James'),
('JPN005', 'Japão', 'Naomi Osaka');
# Listando votação do melhor uniforme
SELECT id_uniform, COUNT(vote_id) AS votes
FROM uniform_vote_pool_tb
GROUP BY id_uniform
ORDER BY votes DESC;

#