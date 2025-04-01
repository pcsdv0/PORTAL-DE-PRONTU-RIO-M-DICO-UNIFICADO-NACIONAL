create database ppmun;
use ppmun;
 CREATE TABLE pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(255),
    consentimento BOOLEAN DEFAULT FALSE
);

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    id_paciente INT UNIQUE,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE SET NULL
);

CREATE TABLE administradores (
    id_admin INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    id_usuario INT UNIQUE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE hospitais (
    id_hospital INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    CNPJ CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(255)
);

CREATE TABLE medicos (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    CRM VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    id_hospital INT,
    id_usuario INT UNIQUE,
    FOREIGN KEY (id_hospital) REFERENCES hospitais(id_hospital) ON DELETE SET NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE consultas (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_hospital INT NOT NULL,
    data_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,
    motivo VARCHAR(255),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE CASCADE,
    FOREIGN KEY (id_hospital) REFERENCES hospitais(id_hospital) ON DELETE CASCADE
);

CREATE TABLE exames (
    id_exame INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_medico INT,
    id_hospital INT NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    data_solicitacao DATE NOT NULL,
    data_resultado DATE DEFAULT NULL,
    resultado TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE SET NULL,
    FOREIGN KEY (id_hospital) REFERENCES hospitais(id_hospital) ON DELETE CASCADE
);

CREATE TABLE internacoes (
    id_internacao INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_hospital INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE DEFAULT NULL,
    motivo VARCHAR(255),
    status ENUM('em andamento', 'finalizada') NOT NULL DEFAULT 'em andamento',
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_hospital) REFERENCES hospitais(id_hospital) ON DELETE CASCADE
);

CREATE TABLE prescricoes (
    id_prescricao INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    data_prescricao DATE NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    validade DATE DEFAULT NULL,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE CASCADE
);

CREATE TABLE farmacias (
    id_farmacia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    CNPJ CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(255),
    id_hospital INT,
    FOREIGN KEY (id_hospital) REFERENCES hospitais(id_hospital) ON DELETE SET NULL
);

CREATE TABLE validacao_prescricoes (
    id_validacao INT PRIMARY KEY AUTO_INCREMENT,
    id_farmacia INT NOT NULL,
    id_prescricao INT NOT NULL,
    data_validacao DATE NOT NULL,
    status_validacao ENUM('pendente', 'aprovada', 'rejeitada') NOT NULL DEFAULT 'pendente',
    FOREIGN KEY (id_farmacia) REFERENCES farmacias(id_farmacia) ON DELETE CASCADE,
    FOREIGN KEY (id_prescricao) REFERENCES prescricoes(id_prescricao) ON DELETE CASCADE
);

CREATE TABLE permissoes (
    id_permissao INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_usuario INT NOT NULL,
    tipo_acesso VARCHAR(50) NOT NULL,
    nivel_acesso ENUM('total', 'parcial') NOT NULL DEFAULT 'parcial',
    data_autorizacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE notificacoes (
    id_notificacao INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_usuario INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    mensagem TEXT NOT NULL,
    data_envio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE auditorias (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    acao VARCHAR(50) NOT NULL,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    descricao VARCHAR(255),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);
