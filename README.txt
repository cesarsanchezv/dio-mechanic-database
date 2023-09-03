
# 🖥🚙 SISTEMA DE ORDENS DE SERVIÇO
## Construa um Projeto Lógico de Banco de Dados do Zero

## Modelo EER

A imagem mechanic.png descreve o modelo EER do banco de dados, contendo as relações Client, Vehicle, Mechanic, Services, Parts, Team, SO e as relações soServices e soParts.

## Queries Solicitadas

Para cada tabela foi inserido um conjunto consolidado de dados respeitando as caraterísticas de cada um dos atributos definidos no escopo. As queries às quais se dá resposta no projeto são as seguintes:

1. Quais são os veículos de Jõao Silva?

        select v.idVehicle as Vehicle_N, v.Brand, v.Model, v.modelYear as Model_Year, v.Chassis, v.Plate, v.v_idClient as Client_N
        from vehicle v
        join clients c on v.v_idClient = c.idClient
        where c.Fname = 'João' and c.Lname = 'Silva';

2. Serviços concluídos por tipo

        select s.soType as Type_of_Service, COUNT(*) as Total_Finished_Services
        from so s
        where s.soStatus = 'Finished'
        group by s.soType
        order by Total_Finished_Services desc;

3. Mecânicos que ganham mais do que a média de salários

        select mfName, mlName, salary
        from mechanic
        where salary > (select avg(salary) from mechanic)
        order by salary desc;

4. Clientes com serviços em aberto

        select concat(c.Fname,' ', c.Lname) as Full_Name, COUNT(s.idSO) as Ongoing_Services
        from clients c
        left join vehicle v on c.idClient = v.v_idClient
        left join so s on v.idVehicle = s.so_idVehicle
        where s.soStatus in ('Open', 'In Progress')
        group by c.idClient, c.Fname, c.Lname
        order by c.Lname, c.Fname;

5. Listar equipes e quantidade de mecânicos em cada equipe para equipes com mais de 3 colaboradores

        select t.tName as Team, COUNT(m.idMechanic) as Total_number_Mechanics
        from team t
        left join mechanic m on t.idTeam = m.m_idTeam
        group by t.idTeam, t.tName
        having Total_number_Mechanics > 3
        order by t.tName;

6. Valor dos serviços e peças agrupados por status

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