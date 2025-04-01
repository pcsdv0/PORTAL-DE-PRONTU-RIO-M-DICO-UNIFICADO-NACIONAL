/*lista de todas as consultas médicas com informações do paciente
e do médico.*/
SELECT 
    consultas.id_consulta, 
    pacientes.nome AS nome_paciente, 
    medicos.nome AS nome_medico, 
    consultas.data_consulta, 
    consultas.hora_consulta, 
    consultas.motivo
FROM consultas
LEFT JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
LEFT JOIN medicos ON consultas.id_medico = medicos.id_medico;


/*lista de todos os exames realizados, incluindo informações do
paciente e do médico que solicitou o exame. */
SELECT 
    exames.id_exame, 
    pacientes.nome AS nome_paciente, 
    medicos.nome AS nome_medico, 
    exames.tipo, 
    exames.data_solicitacao, 
    exames.data_resultado, 
    exames.resultado
FROM exames
LEFT JOIN pacientes ON exames.id_paciente = pacientes.id_paciente
LEFT JOIN medicos ON exames.id_medico = medicos.id_medico;


/*lista de todas as internações com informações do paciente e do
hospital. Essa consulta exibe todas as internações, incluindo os dados do paciente e do
hospital.*/
SELECT 
    internacoes.id_internacao, 
    pacientes.nome AS nome_paciente, 
    hospitais.nome AS nome_hospital, 
    internacoes.data_entrada, 
    internacoes.data_saida, 
    internacoes.motivo
FROM internacoes
LEFT JOIN pacientes ON internacoes.id_paciente = pacientes.id_paciente
LEFT JOIN hospitais ON internacoes.id_hospital = hospitais.id_hospital;


/*lista de todos os médicos e suas consultas, se houver. Essa consulta
retorna todos os médicos, mesmo aqueles que ainda não tenham realizado consultas.
*/
SELECT 
    medicos.id_medico, 
    medicos.nome AS nome_medico, 
    consultas.id_consulta, 
    consultas.data_consulta, 
    consultas.hora_consulta, 
    consultas.motivo
FROM medicos
RIGHT JOIN consultas ON medicos.id_medico = consultas.id_medico;


/*lista de todas as farmácias e suas prescrições associadas, se houver.
Essa consulta retorna todas as farmácias cadastradas, mesmo aquelas que ainda não
tenham recebido prescrições.*/
SELECT 
    farmacias.id_farmacia, 
    farmacias.nome AS nome_farmacia, 
    prescricoes.id_prescricao, 
    prescricoes.data_prescricao, 
    prescricoes.descricao, 
    prescricoes.validade
FROM farmacias
RIGHT JOIN validacao_prescricoes ON farmacias.id_farmacia = validacao_prescricoes.id_farmacia
RIGHT JOIN prescricoes ON validacao_prescricoes.id_prescricao = prescricoes.id_prescricao;


/*lista de todos os usuários e suas permissões associadas, se houver.
Essa consulta retorna todos os usuários cadastrados*/
SELECT 
    usuarios.id_usuario, 
    usuarios.nome AS nome_usuario, 
    permissoes.id_permissao, 
    permissoes.tipo_acesso, 
    permissoes.data_autorizacao
FROM usuarios
RIGHT JOIN permissoes ON usuarios.id_usuario = permissoes.id_usuario;


/*lista de todas as consultas médicas com informações do paciente
e do médico. Essa consulta exibe apenas as consultas onde há um paciente e um médico
associados.*/
  SELECT   
    consultas.id_consulta, 
    pacientes.nome AS nome_paciente, 
    medicos.nome AS nome_medico, 
    consultas.data_consulta, 
    consultas.hora_consulta, 
    consultas.motivo
FROM consultas
INNER JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
INNER JOIN medicos ON consultas.id_medico = medicos.id_medico;


/*lista de todos os exames realizados com informações do paciente
e do médico que solicitou. A consulta retorna apenas os exames que possuem um
paciente e um médico. */
SELECT 
    exames.id_exame, 
    pacientes.nome AS nome_paciente, 
    medicos.nome AS nome_medico, 
    exames.tipo, 
    exames.data_solicitacao, 
    exames.data_resultado, 
    exames.resultado
FROM exames
INNER JOIN pacientes ON exames.id_paciente = pacientes.id_paciente
INNER JOIN medicos ON exames.id_medico = medicos.id_medico;


/*lista de todas as internações com informações do paciente e do
hospital. Retorna apenas as internações que possuem um paciente e um
hospital cadastrados.*/
SELECT 
    internacoes.id_internacao, 
    pacientes.nome AS nome_paciente, 
    hospitais.nome AS nome_hospital, 
    internacoes.data_entrada, 
    internacoes.data_saida, 
       internacoes.motivo
FROM internacoes
INNER JOIN pacientes ON internacoes.id_paciente = pacientes.id_paciente
INNER JOIN hospitais ON internacoes.id_hospital = hospitais.id_hospital;


/*Agendar uma consulta médica no banco de dados,
 garantindo que o paciente, o hospital e o horário do médico sejam validados 
 antes da inserção.*/
DELIMITER $$

CREATE PROCEDURE AgendarConsulta(
    IN p_id_paciente INT,
    IN p_id_medico INT,
    IN p_id_hospital INT,
    IN p_data DATE,
    IN p_hora TIME,
    IN p_motivo VARCHAR(255)
)
BEGIN
    DECLARE medico_disponivel INT;
    DECLARE paciente_existente INT;
    DECLARE hospital_existente INT;
    
    -- Verificar se o paciente existe
    SELECT COUNT(*) INTO paciente_existente
    FROM pacientes
    WHERE id_paciente = p_id_paciente;
    
    IF paciente_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Paciente não encontrado!';
    END IF;
    
    -- Verificar se o hospital existe
    SELECT COUNT(*) INTO hospital_existente
    FROM hospitais
    WHERE id_hospital = p_id_hospital;
    
    IF hospital_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hospital não encontrado!';
    END IF;
    
    -- Verificar se o médico está disponível no horário solicitado
    SELECT COUNT(*) INTO medico_disponivel
    FROM consultas
    WHERE id_medico = p_id_medico 
      AND id_hospital = p_id_hospital
      AND data = p_data
      AND hora = p_hora;
    
    IF medico_disponivel > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Médico já está agendado para este horário!';
    END IF;
    
    -- Agendar a consulta
    INSERT INTO consultas (id_paciente, id_medico, id_hospital, data, hora, motivo)
    VALUES (p_id_paciente, p_id_medico, p_id_hospital, p_data, p_hora, p_motivo);

    SELECT 'Consulta agendada com sucesso!' AS status;
    
END$$

DELIMITER ;



