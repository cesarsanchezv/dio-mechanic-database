create database mechanic;
use mechanic;

-- Criar relação Client
create table clients(
			idClient int auto_increment primary key,
            clCPF char(11) not null,
            Fname varchar(15) not null,
            Lname varchar(25) not null,
            clPhone varchar(25) not null,
            clEmail varchar(100) not null,
            clStreet varchar(45) not null,
            clSNumber varchar(15),
            clDistrict varchar(45) not null,
            clCity varchar(45) not null,
            clUFF char(2) not null,
            constraint unique_cpf_client unique (clCPF)
);
INSERT INTO clients (clCPF, Fname, Lname, clPhone, clEmail, clStreet, clSNumber, clDistrict, clCity, clUFF)
VALUES
    ('12345678901', 'João', 'Silva', '(11) 1234-5678', 'joao@email.com', 'Rua das Flores', '123', 'Bairro Alegre', 'São Paulo', 'SP'),
    ('23456789012', 'Maria', 'Santos', '(21) 2345-6789', 'maria@email.com', 'Avenida Central', '456', 'Bairro Tranquilo', 'Rio de Janeiro', 'RJ'),
    ('34567890123', 'Pedro', 'Oliveira', '(31) 3456-7890', 'pedro@email.com', 'Rua das Palmeiras', '789', 'Bairro Verde', 'Belo Horizonte', 'MG'),
    ('45678901234', 'Ana', 'Pereira', '(51) 4567-8901', 'ana@email.com', 'Avenida dos Pássaros', '101', 'Bairro Azul', 'Porto Alegre', 'RS'),
    ('56789012345', 'Carlos', 'Ferreira', '(41) 5678-9012', 'carlos@email.com', 'Rua do Sol', '222', 'Bairro Quente', 'Curitiba', 'PR'),
    ('67890123456', 'Sandra', 'Ribeiro', '(71) 6789-0123', 'sandra@email.com', 'Avenida das Estrelas', '333', 'Bairro Marítimo', 'Salvador', 'BA'),
    ('78901234567', 'Fernando', 'Martins', '(48) 7890-1234', 'fernando@email.com', 'Rua da Lua', '777', 'Bairro Noturno', 'Florianópolis', 'SC'),
    ('89012345678', 'Mariana', 'Almeida', '(85) 8901-2345', 'mariana@email.com', 'Avenida das Rosas', '888', 'Bairro das Flores', 'Fortaleza', 'CE'),
    ('90123456789', 'Lucas', 'Rodrigues', '(81) 9012-3456', 'lucas@email.com', 'Rua das Árvores', '444', 'Bairro Arborizado', 'Recife', 'PE'),
    ('01234567890', 'Isabel', 'Gonçalves', '(61) 0123-4567', 'isabel@email.com', 'Avenida das Montanhas', '555', 'Bairro Serrano', 'Brasília', 'DF');


-- Criar relação Vehicle
create table vehicle(
			idVehicle int auto_increment primary key,
            Brand varchar(45) not null,
            Model varchar(45) not null,
            modelYear year not null,
            Chassis char(17) not null,
            Plate char(7) not null,
            v_idClient int,
            constraint unique_chassis_vehicle unique (Chassis),
            constraint unique_plate_vehicle unique (Plate),
            constraint fk_vehicle_client foreign key (v_idClient) references clients(idClient)
);

INSERT INTO vehicle (Brand, Model, modelYear, Chassis, Plate, v_idClient)
VALUES
    ('Ford', 'Focus', '2022', 'ABC12345678901234', 'XYZ1234', 1),
    ('Toyota', 'Corolla', '2021', 'DEF12345678901234', 'LMN5678', 2),
    ('Honda', 'Civic', '2022', 'GHI12345678901234', 'OPQ9012', 3),
    ('Chevrolet', 'Cruze', '2022', 'JKL12345678901234', 'RST3456', 4),
    ('Volkswagen', 'Golf', '2021', 'UVW12345678901234', 'YZA7890', 5),
    ('Hyundai', 'Elantra', '2022', 'BCD12345678901234', 'BCD1234', 6),
    ('Nissan', 'Sentra', '2021', 'EFG12345678901234', 'EFG5678', 7),
    ('Mazda', 'Mazda3', '2022', 'HIJ12345678901234', 'HIJ9012', 8),
    ('Kia', 'Forte', '2021', 'KLM12345678901234', 'KLM3456', 9),
    ('Subaru', 'Impreza', '2022', 'NOP12345678901234', 'NOP7890', 10),
    ('Ford', 'Fiesta', '2021', 'QRS12345678901234', 'QRS1234', 1),
    ('Toyota', 'Camry', '2022', 'TUV12345678901234', 'TUV5678', 2),
    ('Honda', 'Accord', '2021', 'WXY12345678901234', 'WXY9012', 3),
    ('Chevrolet', 'Malibu', '2022', 'ZAB12345678901234', 'ZAB3456', 4),
    ('Volkswagen', 'Passat', '2021', 'CDE12345678901234', 'CDE7890', 5),
    ('Hyundai', 'Sonata', '2022', 'FGH12345678901234', 'FGH1234', 6),
    ('Nissan', 'Altima', '2021', 'IJK12345678901234', 'IJK5678', 7),
    ('Mazda', 'Mazda6', '2022', 'LMN12345678901234', 'LMN9012', 8),
    ('Kia', 'Optima', '2021', 'OPQ12345678901234', 'OPQ3456', 9),
    ('Subaru', 'Legacy', '2022', 'RST12345678901234', 'RST7890', 10);

-- Criar relação Team
create table team(
			idTeam int auto_increment primary key,
            tName varchar(20) not null,
            constraint unique_team_name unique (tName)
);

INSERT INTO team (tName)
VALUES
    ('Vermelho'),
    ('Azul'),
    ('Verde'),
    ('Amarelo');

-- Criar relação Mechanic
create table mechanic(
			idMechanic int auto_increment primary key,
            mfName varchar(15) not null,
            mlName varchar(20) not null,
            mCPF char(11) not null,
            m_specialist ENUM('Assembly', 'Mechanics', 'Electronics', 'Diagnostics'),
            hiring_date date not null,
            salary float not null,
            m_idTeam int,
            constraint unique_mCPF unique (mCPF),
            constraint fk_mechanic_team foreign key (m_idTeam) references team(idTeam)
);

INSERT INTO mechanic (mfName, mlName, mCPF, m_specialist, hiring_date, salary, m_idTeam)
VALUES
    ('José', 'Silva', '11111111111', 'Assembly', '2020-01-15', 3500.00, 1),
    ('Maria', 'Santos', '11111111112', 'Mechanics', '2021-03-20', 3200.00, 1),
    ('Carlos', 'Ferreira', '11111111113', 'Electronics', '2019-07-10', 3800.00, 1),
    ('Ana', 'Pereira', '11111111114', 'Diagnostics', '2022-02-05', 3900.00, 1),
    ('Pedro', 'Oliveira', '11111111115', 'Assembly', '2020-04-25', 3600.00, 2),
    ('Sandra', 'Ribeiro', '11111111116', 'Mechanics', '2021-08-12', 3300.00, 2),
    ('Fernando', 'Martins', '11111111117', 'Electronics', '2019-11-30', 3700.00, 2),
    ('Mariana', 'Almeida', '11111111118', 'Diagnostics', '2022-05-18', 4000.00, 2),
    ('Lucas', 'Rodrigues', '11111111119', 'Assembly', '2020-06-20', 3400.00, 3),
    ('Isabel', 'Gonçalves', '11111111120', 'Mechanics', '2021-10-07', 3100.00, 3),
    ('Fernanda', 'Lima', '11111111121', 'Electronics', '2020-01-28', 3600.00, 3),
    ('Ricardo', 'Sousa', '11111111122', 'Assembly', '2021-01-10', 3550.00, 4),
    ('Aline', 'Fernandes', '11111111123', 'Mechanics', '2021-04-15', 3250.00, 4),
    ('Marcos', 'Gomes', '11111111124', 'Electronics', '2020-09-08', 3850.00, 4);

-- Criar tabela Services
create table services(
			idServices int auto_increment primary key,
            sName varchar(100) not null,
            technical_hours float not null,
            sPrice float not null,
            constraint unique_service_name unique (sName)
);

-- Inserir 30 serviços fictícios
INSERT INTO services (sName, technical_hours, sPrice)
VALUES
    ('Troca de Óleo', 1.5, 50.00),
    ('Alinhamento de Rodas', 1.0, 45.00),
    ('Balanceamento de Rodas', 1.0, 40.00),
    ('Troca de Filtro de Ar', 0.5, 20.00),
    ('Troca de Filtro de Óleo', 0.5, 25.00),
    ('Troca de Velas', 1.0, 30.00),
    ('Troca de Correia Dentada', 2.0, 80.00),
    ('Limpeza de Bicos Injetores', 1.5, 70.00),
    ('Troca de Pastilhas de Freio', 1.0, 60.00),
    ('Troca de Discos de Freio', 1.5, 70.00),
    ('Revisão de Suspensão', 2.0, 90.00),
    ('Troca de Amortecedores', 2.5, 120.00),
    ('Troca de Bateria', 0.5, 35.00),
    ('Troca de Lâmpadas', 0.5, 15.00),
    ('Troca de Escapamento', 1.5, 75.00),
    ('Recarga de Ar Condicionado', 2.0, 100.00),
    ('Diagnóstico Eletrônico', 1.0, 55.00),
    ('Troca de Palhetas do Limpador', 0.5, 15.00),
    ('Balanceamento de Rodas (Rodas de Liga Leve)', 1.0, 50.00),
    ('Troca de Bieletas', 1.0, 40.00),
    ('Troca de Terminais de Direção', 1.5, 60.00),
    ('Troca de Coxins', 1.5, 70.00),
    ('Troca de Juntas Homocinéticas', 2.0, 90.00),
    ('Troca de Radiador', 2.0, 85.00),
    ('Limpeza do Sistema de Arrefecimento', 1.5, 70.00),
    ('Troca de Bomba dÁgua', 2.0, 80.00),
    ('Reparo de Motor de Partida', 1.0, 45.00),
    ('Troca de Cabos de Vela', 0.5, 25.00),
    ('Troca de Óleo do Câmbio Automático', 2.5, 110.00);

-- Criar tabela Parts
create table parts(
			idParts int auto_increment primary key,
            pName varchar(50) not null,
            pDescription varchar(255) not null,
            pPrice float not null,
            pStock int not null
);

-- Inserir 50 peças fictícias
INSERT INTO parts (pName, pDescription, pPrice, pStock)
VALUES
    ('Filtro de Ar Fram CA9360', 'Filtro de ar para motores a gasolina e diesel. Marca: Fram', 15.99, 100),
    ('Bateria Moura MA50-DI', 'Bateria automotiva de 50Ah com tecnologia AGM. Marca: Moura', 249.99, 50),
    ('Pastilha de Freio Bosch BP1101', 'Pastilha de freio dianteira. Marca: Bosch', 39.99, 80),
    ('Amortecedor Monroe 376067', 'Amortecedor dianteiro para veículos de passeio. Marca: Monroe', 79.99, 60),
    ('Vela de Ignição NGK BKR5E-11', 'Vela de ignição para motores a gasolina. Marca: NGK', 6.49, 200),
    ('Kit Embreagem Luk 623314400', 'Kit de embreagem para veículos. Marca: Luk', 149.99, 30),
    ('Radiador Valeo 734386', 'Radiador para sistema de arrefecimento. Marca: Valeo', 109.99, 40),
    ('Correia Dentada Gates T216RB', 'Correia dentada para motores a gasolina. Marca: Gates', 24.99, 120),
    ('Disco de Freio Fremax BD1676', 'Disco de freio dianteiro. Marca: Fremax', 49.99, 70),
    ('Lâmpada Philips H4', 'Lâmpada para farol de veículos. Marca: Philips', 12.99, 150),
    ('Filtro de Óleo Tecfil PSL146', 'Filtro de óleo para veículos a gasolina e diesel. Marca: Tecfil', 8.49, 90),
    ('Sensor de Oxigênio Bosch 0258010032', 'Sensor de oxigênio para controle de emissões. Marca: Bosch', 29.99, 40),
    ('Coxim do Motor Nakata AM-1053', 'Coxim do motor para veículos de passeio. Marca: Nakata', 16.99, 60),
    ('Junta do Cabeçote Fel-Pro HS26202PT', 'Junta do cabeçote para motores a gasolina. Marca: Fel-Pro', 29.99, 30),
    ('Bomba de Combustível Delphi FE0111', 'Bomba de combustível para veículos a gasolina. Marca: Delphi', 39.99, 40),
    ('Rolamento de Roda SKF VKBA3683', 'Rolamento de roda dianteira. Marca: SKF', 19.99, 80),
    ('Pivô de Suspensão TRW JTE7601', 'Pivô de suspensão para veículos. Marca: TRW', 12.99, 70),
    ('Sensor de Temperatura Delphi TS10116', 'Sensor de temperatura para controle do motor. Marca: Delphi', 8.99, 100),
    ('Mangueira do Radiador Gates 22318', 'Mangueira do radiador para sistema de arrefecimento. Marca: Gates', 6.49, 120),
    ('Jogo de Velas de Ignição NGK BKR6E', 'Jogo de velas de ignição para motores a gasolina. Marca: NGK', 19.99, 50),
    ('Terminal de Direção Cofap TI3330', 'Terminal de direção para veículos. Marca: Cofap', 7.99, 90),
    ('Kit Correia Dentada Contitech CT1003K1', 'Kit correia dentada com tensor. Marca: Contitech', 34.99, 40),
    ('Sensor ABS Bosch 0265006339', 'Sensor ABS para controle de frenagem. Marca: Bosch', 22.99, 60),
    ('Kit Amortecedor Cofap KIT7156', 'Kit amortecedor dianteiro e traseiro. Marca: Cofap', 149.99, 30),
    ('Cilindro de Freio Traseiro Nakata CTR2007', 'Cilindro de freio traseiro para veículos. Marca: Nakata', 9.99, 80),
    ('Sensor de Posição do Virabrequim Delphi SS10223', 'Sensor de posição do virabrequim. Marca: Delphi', 13.49, 50),
    ('Mola de Suspensão Nakata NML172', 'Mola de suspensão dianteira. Marca: Nakata', 29.99, 40),
    ('Interruptor de Luz de Freio Bosch 0344192011', 'Interruptor de luz de freio. Marca: Bosch', 4.99, 120),
    ('Filtro de Combustível Fram G3606', 'Filtro de combustível para veículos a gasolina e diesel. Marca: Fram', 5.49, 100),
    ('Bomba DÁgua Cofap CF17200', 'Bomba dágua para motores a gasolina. Marca: Cofap', 16.99, 60);

-- Criar tabela SO
create table so(
			idSO int auto_increment primary key,
            soDescription varchar(255) not null,
            soType ENUM('Engine', 'Transmission', 'Electric', 'Suspension', 'Air Conditioning', 'Alignment and Balancing', 'Accessories and Tires') not null,
            open_date date not null,
            closing_date date not null,
            soStatus ENUM('Open', 'In Progress', 'Finished'),
            so_idVehicle int,
            so_idClient int,
            so_idTeam int,
            constraint fk_so_vehicle foreign key (so_idVehicle) references vehicle(idVehicle),
            constraint fk_so_client foreign key (so_idVehicle) references vehicle(v_idClient),
            constraint fl_so_team foreign key (so_idTeam) references team(idTeam)
);

INSERT INTO so (soDescription, soType, open_date, closing_date, soStatus, so_idVehicle, so_idClient, so_idTeam)
VALUES
    ('Troca de Óleo e Filtros', 'Engine', '2023-08-11', '2023-08-12', 'Open', 1, 1, 1),
    ('Reparo Elétrico', 'Electric', '2023-08-12', '2023-08-13', 'In Progress', 2, 2, 2),
    ('Troca de Amortecedores', 'Suspension', '2023-08-13', '2023-08-14', 'Finished', 3, 3, 3),
    ('Recarga de Ar Condicionado', 'Air Conditioning', '2023-08-14', '2023-08-15', 'In Progress', 4, 4, 4),
    ('Balanceamento de Rodas', 'Alignment and Balancing', '2023-08-15', '2023-08-16', 'Open', 5, 5, 1),
    ('Troca de Bateria', 'Electric', '2023-08-16', '2023-08-17', 'Finished', 6, 6, 2),
    ('Troca de Discos de Freio', 'Suspension', '2023-08-17', '2023-08-18', 'Finished', 7, 7, 3),
    ('Troca de Compressor de Ar Condicionado', 'Air Conditioning', '2023-08-18', '2023-08-19', 'Open', 8, 8, 4),
    ('Alinhamento e Balanceamento', 'Alignment and Balancing', '2023-08-19', '2023-08-20', 'In Progress', 9, 9, 1),
    ('Troca de Óleo', 'Engine', '2023-08-20', '2023-08-21', 'Finished', 10, 10, 2);

-- Criar tabela relação SO - Parts
create table soParts(
			pQuantity int not null,
            sop_idSO int,
            sop_idParts int,
            constraint fk_soparts_so foreign key (sop_idSO) references so(idSO),
            constraint fk_soparts_parts foreign key (sop_idParts) references parts(idParts)
);

INSERT INTO soParts (pQuantity, sop_idSO, sop_idParts)
VALUES
    (3, 1, 1),
    (2, 2, 2),
    (4, 3, 3),
    (2, 4, 4),
    (2, 5, 5),
    (1, 6, 6),
    (4, 7, 7),
    (2, 8, 8),
    (2, 9, 9),
    (3, 10, 10);
    
-- Criar tabela relação SO - Services
create table soServices(
			sQuantity int not null,
            sos_idServices int,
            sos_idSO int,
            constraint fk_soservices_services foreign key (sos_idServices) references services(idServices),
            constraint fk_soservices_so foreign key (sos_idSO) references so(idSO)
);


INSERT INTO soServices (sQuantity, sos_idServices, sos_idSO)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (1, 3, 3),
    (1, 4, 4),
    (2, 5, 5),
    (1, 6, 6),
    (2, 7, 7),
    (1, 8, 8),
    (2, 9, 9), 
    (1, 10, 10);
    
    show tables;
    select * from clients;
    select * from mechanic;
    select * from parts;
    select * from services;
    select * from so;
    select * from soparts;
    select * from soservices;
    select * from team;
    select * from vehicle;
    
    -- Quais são os veículos de Jõao Silva?
select v.idVehicle as Vehicle_N, v.Brand, v.Model, v.modelYear as Model_Year, v.Chassis, v.Plate, v.v_idClient as Client_N
from vehicle v
join clients c on v.v_idClient = c.idClient
where c.Fname = 'João' and c.Lname = 'Silva';

-- Serviços concluídos por tipo
select s.soType as Type_of_Service, COUNT(*) as Total_Finished_Services
from so s
where s.soStatus = 'Finished'
group by s.soType
order by Total_Finished_Services desc;

-- Mecânicos que ganham mais do que a média de salários
select mfName, mlName, salary
from mechanic
where salary > (select avg(salary) from mechanic)
order by salary desc;

-- Clientes com serviços em aberto
select concat(c.Fname,' ', c.Lname) as Full_Name, COUNT(s.idSO) as Ongoing_Services
from clients c
left join vehicle v on c.idClient = v.v_idClient
left join so s on v.idVehicle = s.so_idVehicle
where s.soStatus in ('Open', 'In Progress')
group by c.idClient, c.Fname, c.Lname
order by c.Lname, c.Fname;

-- Listar equipes e quantidade de mecânicos em cada equipe para equipes com mais de 3 colaboradores
select t.tName as Team, COUNT(m.idMechanic) as Total_number_Mechanics
from team t
left join mechanic m on t.idTeam = m.m_idTeam
group by t.idTeam, t.tName
having Total_number_Mechanics > 3
order by t.tName;

-- Valor dos serviços e peças agrupados por status
select
    soStatus as Status_SO,
    ROUND(SUM(servico_total), 2) as Services_TV,
    ROUND(SUM(pecas_total), 2) as Parts_TV,
    ROUND(SUM(servico_total + pecas_total), 2) as Total_Value
from (
    select
        soStatus,
        IFNULL(SUM(services.sPrice * soServices.sQuantity), 0) as servico_total,
        IFNULL(SUM(parts.pPrice * soParts.pQuantity), 0) as pecas_total
    from so
    left join soServices on so.idSO = soServices.sos_idSO
    left join  services on soServices.sos_idServices = services.idServices
    left join  soParts on so.idSO = soParts.sop_idSO
    left join  parts on soParts.sop_idParts = parts.idParts
    group by soStatus, so.idSO
) as subquery
group by soStatus;