/* Listar Veterinários com Especialidade Específica
Escreva uma consulta para listar todos os veterinários que têm a especialidade "Dermatologista".*/

SELECT * FROM VETERINARIO v 
WHERE ESPECIALIDADE = 'Dermatologista'

/* Buscar Pacientes por Faixa Etária
Escreva uma consulta para listar todos os pacientes com idade entre 2 e 5 anos.. */

SELECT * FROM PACIENTE p 
WHERE p.IDADE BETWEEN 2 AND 5

/*Listar Agendamentos em um Período Específico
Escreva uma consulta para listar todos os agendamentos realizados entre
 1º de janeiro de 2024 e 31 de março de 2024. */

SELECT * FROM AGENDAMENTO a 
WHERE a.DATA_HORA BETWEEN '2024-01-01' AND '2024-03-31'

/* Buscar Medicamentos com Preço Superior a Um Valor
Escreva uma consulta para listar todos os medicamentos com preço superior a 25 reais. */

SELECT * FROM MEDICAMENTOS m 
WHERE m.PRECO > 25

/* Filtrar Receitas por Data e Veterinário
Escreva uma consulta para listar todas as receitas emitidas após 1º de junho 
de 2024 e associadas a um agendamento realizado pelo veterinário "Dr. Ana Souza". 
Use uma subconsulta para encontrar o id_veterinario. */

SELECT * FROM RECEITA r
WHERE r.DATA_EMISSAO > '2024-06-01' 
	AND r.ID_AGENDAMENTO = (SELECT a.id_agendamento
								FROM AGENDAMENTO a 
								WHERE a.id_veterinario = (SELECT v.id_veterinario
															FROM VETERINARIO v 
														  WHERE v.nome = 'Dr. Ana Souza'))

/* Listar Pacientes de Um Tutor Específico
Escreva uma consulta para listar todos os pacientes que pertencem ao tutor com o 
nome "Maria Silva". Use uma subconsulta para encontrar o id_tutor. */

SELECT * FROM PACIENTE p 
WHERE p.id_tutor = ( SELECT t.id_tutor FROM TUTOR t WHERE t.nome = 'Maria Silva')


/* Buscar Itens de Receita para Medicamento Específico
Escreva uma consulta para listar todos os itens de receita que incluem o medicamento 
"Anti-inflamatório Y". Use uma subconsulta para encontrar o id_medicamento. */

SELECT * FROM ITENSRECEITA i 
WHERE i.id_medicamento = 
	(SELECT m.id_medicamento FROM MEDICAMENTOS m WHERE m.NOME = 'Anti-inflamatório Y')


/* Listar Agendamentos por Veterinário e Motivo
Escreva uma consulta para listar todos os agendamentos realizados 
pelo veterinário "Dr. Pedro Lima" e que tenham o motivo "Exame de sangue". 
Use uma subconsulta para encontrar o id_veterinario. */
	
SELECT * FROM AGENDAMENTO a 
WHERE a.ID_VETERINARIO = (SELECT v.id_veterinario FROM VETERINARIO v
WHERE v.nome = 'Dr. Pedro Lima')
	

/* Listar Medicamentos com Descrição Não Nula e Preço Inferior a 50 Reais
Escreva uma consulta para listar todos os medicamentos que 
possuem uma descrição e cujo preço é inferior a 50 reais. */

SELECT * FROM MEDICAMENTOS m 
WHERE DESCRICAO IS NOT NULL AND PRECO < 50.00

/* Listar Pacientes com Peso Entre Dois Valores
Escreva uma consulta para listar todos os pacientes com peso entre 3 e 10 kg. */

SELECT * FROM PACIENTE p 
WHERE PESO BETWEEN 3 AND 10

/* Buscar Pacientes de um Tutor e com Peso Superior a um Valor
Escreva uma consulta para listar todos os pacientes que 
pertencem ao tutor com o nome "Carlos Lima" e têm peso superior a 5 kg. */

SELECT * FROM PACIENTE p 
WHERE p.ID_TUTOR = (SELECT t.id_tutor FROM TUTOR t WHERE NOME = 'Carlos Lima')
AND PESO > 5

/* Listar Pacientes de Especie 'Cão' com Peso Inferior a 7 kg
Escreva uma consulta para listar todos os 
pacientes da espécie "Cão" com peso inferior a 7 kg. */

SELECT * FROM PACIENTE p 
WHERE p.ESPECIE = 'Cão' AND PESO < 7

/* Listar Agendamentos de um Período com Peso dos Pacientes
Escreva uma consulta para listar todos os agendamentos realizados entre 1º 
de abril de 2024 e 30 de junho de 2024, e mostrar o nome do 
paciente e o peso do paciente associado. */

SELECT a.*
     , (SELECT p.nome FROM PACIENTE p WHERE p.id_paciente = a.ID_PACIENTE )
     , (SELECT p.PESO FROM PACIENTE p WHERE p.id_paciente = a.ID_PACIENTE )
  FROM AGENDAMENTO a 
 WHERE a.DATA_HORA BETWEEN '2024-04-01' AND '2024-06-30' 

/* Listar Pacientes que Não Tiveram Consultas
Escreva uma consulta para listar todos os pacientes 
que não têm nenhum agendamento registrado. */

SELECT p.* 
FROM PACIENTE p 
WHERE p.ID_PACIENTE NOT IN (SELECT a.ID_PACIENTE FROM AGENDAMENTO a)


/* Listar Pacientes que Não Tiveram Consultas por periodo
Escreva uma consulta para listar todos os pacientes que não têm nenhum 
agendamento registrado no período de 01/01/2024 até 15/01/2024 */

SELECT * FROM PACIENTE p 
WHERE p.ID_PACIENTE NOT IN (
		SELECT a.id_paciente
		FROM AGENDAMENTO a 
		WHERE a.data_hora BETWEEN '2024-01-01' AND '2024-01-15'
)















































































































