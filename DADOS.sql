-- Inserindo dados na tabela 'pacientes'
INSERT INTO pacientes (nome, CPF, data_nascimento, telefone, email, endereco, consentimento) VALUES
('João Silva', '12345678901', '1985-10-25', '987654321', 'joao.silva@gmail.com', 'Rua 1, Bairro A', TRUE),
('Maria Oliveira', '23456789012', '1990-03-15', '987654322', 'maria.oliveira@gmail.com', 'Rua 2, Bairro B', TRUE),
('Carlos Souza', '34567890123', '1975-07-30', '987654323', 'carlos.souza@gmail.com', 'Rua 3, Bairro C', TRUE),
('Ana Costa', '45678901234', '1983-12-05', '987654324', 'ana.costa@gmail.com', 'Rua 4, Bairro D', FALSE),
('Lucas Pereira', '56789012345', '1995-06-20', '987654325', 'lucas.pereira@gmail.com', 'Rua 5, Bairro E', TRUE),
('Fernanda Lima', '67890123456', '1988-09-12', '987654326', 'fernanda.lima@gmail.com', 'Rua 6, Bairro F', FALSE),
('Roberto Gomes', '78901234567', '1992-01-17', '987654327', 'roberto.gomes@gmail.com', 'Rua 7, Bairro G', TRUE),
('Juliana Santos', '89012345678', '1980-11-29', '987654328', 'juliana.santos@gmail.com', 'Rua 8, Bairro H', TRUE),
('Patricia Rocha', '90123456789', '1993-02-14', '987654329', 'patricia.rocha@gmail.com', 'Rua 9, Bairro I', TRUE),
('Eduardo Almeida', '01234567890', '1987-04-10', '987654330', 'eduardo.almeida@gmail.com', 'Rua 10, Bairro J', TRUE);

-- Inserindo dados na tabela 'usuarios'
INSERT INTO usuarios (nome, email, senha, id_paciente) VALUES
('João Silva', 'joao.silva@gmail.com', 'senha123', 1),
('Maria Oliveira', 'maria.oliveira@gmail.com', 'senha123', 2),
('Carlos Souza', 'carlos.souza@gmail.com', 'senha123', 3),
('Ana Costa', 'ana.costa@gmail.com', 'senha123', 4),
('Lucas Pereira', 'lucas.pereira@gmail.com', 'senha123', 5),
('Fernanda Lima', 'fernanda.lima@gmail.com', 'senha123', 6),
('Roberto Gomes', 'roberto.gomes@gmail.com', 'senha123', 7),
('Juliana Santos', 'juliana.santos@gmail.com', 'senha123', 8),
('Patricia Rocha', 'patricia.rocha@gmail.com', 'senha123', 9),
('Eduardo Almeida', 'eduardo.almeida@gmail.com', 'senha123', 10);

-- Inserindo dados na tabela 'administradores'
INSERT INTO administradores (nome, email, senha, telefone, id_usuario) VALUES
('Administrador 1', 'admin1@hospital.com', 'admin123', '987654331', 1),
('Administrador 2', 'admin2@hospital.com', 'admin123', '987654332', 2),
('Administrador 3', 'admin3@hospital.com', 'admin123', '987654333', 3),
('Administrador 4', 'admin4@hospital.com', 'admin123', '987654334', 4),
('Administrador 5', 'admin5@hospital.com', 'admin123', '987654335', 5);

-- Inserindo dados na tabela 'hospitais'
INSERT INTO hospitais (nome, CNPJ, telefone, email, endereco) VALUES
('Hospital Santa Clara', '12345678000199', '987654336', 'hospital1@hospital.com', 'Rua Central, 100'),
('Hospital das Clínicas', '23456789000188', '987654337', 'hospital2@hospital.com', 'Rua Norte, 200'),
('Hospital São Paulo', '34567890100177', '987654338', 'hospital3@hospital.com', 'Rua Sul, 300'),
('Hospital da Paz', '45678901200166', '987654339', 'hospital4@hospital.com', 'Rua Oeste, 400'),
('Hospital de Câncer', '56789012300155', '987654340', 'hospital5@hospital.com', 'Rua Leste, 500');

-- Inserindo dados na tabela 'medicos'
INSERT INTO medicos (nome, CRM, especialidade, telefone, email, id_hospital, id_usuario) VALUES
('Dr. Pedro Lima', '12345', 'Cardiologista', '987654341', 'pedro.lima@hospital.com', 1, 1),
('Dr. Maria Costa', '23456', 'Pediatra', '987654342', 'maria.costa@hospital.com', 2, 2),
('Dr. João Souza', '34567', 'Neurologista', '987654343', 'joao.souza@hospital.com', 3, 3),
('Dr. Ana Santos', '45678', 'Ortopedista', '987654344', 'ana.santos@hospital.com', 4, 4),
('Dr. Lucas Pereira', '56789', 'Dermatologista', '987654345', 'lucas.pereira@hospital.com', 5, 5);

-- Inserindo dados na tabela 'consultas'
INSERT INTO consultas (id_paciente, id_medico, id_hospital, data_consulta, hora_consulta, motivo) VALUES
(1, 1, 1, '2025-05-15', '09:00:00', 'Dor no peito'),
(2, 2, 2, '2025-06-20', '10:00:00', 'Consulta de rotina'),
(3, 3, 3, '2025-07-25', '11:00:00', 'Dor de cabeça'),
(4, 4, 4, '2025-08-10', '14:00:00', 'Fratura no braço'),
(5, 5, 5, '2025-09-05', '15:00:00', 'Problema na pele');

-- Inserindo dados na tabela 'exames'
INSERT INTO exames (id_paciente, id_medico, id_hospital, tipo, data_solicitacao, data_resultado, resultado) VALUES
(1, 1, 1, 'Eletrocardiograma', '2025-05-15', '2025-05-16', 'Normal'),
(2, 2, 2, 'Exame de sangue', '2025-06-20', '2025-06-21', 'Normal'),
(3, 3, 3, 'Tomografia', '2025-07-25', '2025-07-26', 'Normal'),
(4, 4, 4, 'Raio-X', '2025-08-10', '2025-08-11', 'Fratura detectada'),
(5, 5, 5, 'Biópsia', '2025-09-05', '2025-09-06', 'Sem alterações');

-- Inserindo dados na tabela 'internacoes'
INSERT INTO internacoes (id_paciente, id_hospital, data_entrada, data_saida, motivo, status) VALUES
(1, 1, '2025-05-15', '2025-05-20', 'Infarto', 'finalizada'),
(2, 2, '2025-06-20', NULL, 'Cirurgia', 'em andamento'),
(3, 3, '2025-07-25', '2025-07-30', 'Acidente', 'finalizada'),
(4, 4, '2025-08-10', NULL, 'Fratura no braço', 'em andamento'),
(5, 5, '2025-09-05', '2025-09-10', 'Tratamento de pele', 'finalizada');

-- Inserindo dados na tabela 'prescricoes'
INSERT INTO prescricoes (id_paciente, id_medico, data_prescricao, descricao, validade) VALUES
(1, 1, '2025-05-15', 'Remédio para o coração', '2025-06-15'),
(2, 2, '2025-06-20', 'Antibiótico', '2025-07-20'),
(3, 3, '2025-07-25', 'Analgésico', '2025-08-25'),
(4, 4, '2025-08-10', 'Gesso e analgésico', '2025-09-10'),
(5, 5, '2025-09-05', 'Cremes dermatológicos', '2025-10-05');

-- Inserindo dados na tabela 'farmacias'
INSERT INTO farmacias (nome, CNPJ, telefone, email, endereco, id_hospital) VALUES
('Farmácia Popular', '12345678000111', '987654346', 'farmacia1@hospital.com', 'Rua Saúde, 100', 1),
('Drogaria Bem-Estar', '23456789000122', '987654347', 'farmacia2@hospital.com', 'Rua Bem-Estar, 200', 2),
('Farmácia Saúde', '34567890100133', '987654348', 'farmacia3@hospital.com', 'Rua Saúde, 300', 3),
('Drogaria Vida', '45678901200144', '987654349', 'farmacia4@hospital.com', 'Rua Vida, 400', 4),
('Farmácia Rápida', '56789012300155', '987654350', 'farmacia5@hospital.com', 'Rua Rápida, 500', 5);

-- Inserindo dados na tabela 'validacao_prescricoes'
INSERT INTO validacao_prescricoes (id_farmacia, id_prescricao, data_validacao, status_validacao) VALUES
(1, 1, '2025-05-16', 'aprovada'),
(2, 2, '2025-06-21', 'pendente'),
(3, 3, '2025-07-26', 'aprovada'),
(4, 4, '2025-08-11', 'rejeitada'),
(5, 5, '2025-09-06', 'pendente');

-- Inserindo dados na tabela 'permissoes'
INSERT INTO permissoes (id_paciente, id_usuario, tipo_acesso, nivel_acesso) VALUES
(1, 1, 'visualizar', 'total'),
(2, 2, 'editar', 'parcial'),
(3, 3, 'visualizar', 'total'),
(4, 4, 'visualizar', 'parcial'),
(5, 5, 'editar', 'total');

-- Inserindo dados na tabela 'notificacoes'
INSERT INTO notificacoes (id_paciente, id_usuario, tipo, mensagem) VALUES
(1, 1, 'alerta', 'Consulta agendada para o dia 15 de maio.'),
(2, 2, 'informativo', 'Exame solicitado: Exame de sangue.'),
(3, 3, 'alerta', 'Resultado da tomografia disponível.'),
(4, 4, 'informativo', 'Raio-X realizado com sucesso.'),
(5, 5, 'alerta', 'Prescrição de medicamento pronta para retirada.');

-- Inserindo dados na tabela 'auditorias'
INSERT INTO auditorias (id_usuario, acao, descricao) VALUES
(1, 'login', 'Login realizado com sucesso.'),
(2, 'editar', 'Cadastro de novo paciente realizado.'),
(3, 'delete', 'Exclusão de consulta do paciente João Silva.'),
(4, 'update', 'Alteração no endereço do paciente Maria Oliveira.'),
(5, 'login', 'Login realizado com sucesso.');
