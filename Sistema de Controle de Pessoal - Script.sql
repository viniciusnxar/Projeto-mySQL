-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema controle_pessoas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema controle_pessoas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `controle_pessoas` DEFAULT CHARACTER SET utf8mb3 ;
USE `controle_pessoas` ;

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_curriculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_curriculo` (
  `idCurriculo` INT NOT NULL AUTO_INCREMENT,
  `nivelEscolaridade` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idCurriculo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_cursos` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `nomeCurso` VARCHAR(500) NOT NULL,
  `cargaHoraria` INT NOT NULL,
  PRIMARY KEY (`idCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_funcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_funcao` (
  `idFuncao` INT NOT NULL AUTO_INCREMENT,
  `nomeFuncao` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idFuncao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `estado_civil` VARCHAR(500) NOT NULL,
  `primeiroNomeFuncionario` VARCHAR(500) NOT NULL,
  `segundoNomeFuncionario` VARCHAR(500) NOT NULL,
  `tipoSanguineo` VARCHAR(3) NOT NULL,
  `doadorOrgaos` TINYINT(1) NOT NULL DEFAULT '0',
  `endLogradouro` VARCHAR(500) NOT NULL,
  `endComplemento` VARCHAR(500) NULL DEFAULT NULL,
  `endCEP` VARCHAR(8) NOT NULL,
  `endNumero` VARCHAR(50) NOT NULL,
  `tbl_funcao_idFuncao` INT NOT NULL,
  `tbl_curriculo_idCurriculo` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_funcionario 
ADD CONSTRAINT `fk_tbl_funcionario_tbl_funcao1`
FOREIGN KEY (`tbl_funcao_idFuncao`) 
REFERENCES `controle_pessoas`.`tbl_funcao` (`idFuncao`);

ALTER TABLE tbl_funcionario 
ADD CONSTRAINT `fk_tbl_funcionario_tbl_curriculo1`
FOREIGN KEY (`tbl_curriculo_idCurriculo`) 
REFERENCES `controle_pessoas`.`tbl_curriculo` (`idCurriculo`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_dependentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_dependentes` (
  `idDependente` INT NOT NULL AUTO_INCREMENT,
  `primeiroNomeDependente` VARCHAR(500) NOT NULL,
  `segundoNomeDependente` VARCHAR(500) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `universitario` TINYINT(1) NOT NULL DEFAULT '0',
  `tipoDependencia` VARCHAR(500) NOT NULL,
  `idFuncionario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idDependente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_dependentes
ADD CONSTRAINT `fk_Dependente_Funcionario`
FOREIGN KEY (`idFuncionario`) 
REFERENCES `controle_pessoas`.`tbl_funcionario` (`idFuncionario`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_doencas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_doencas` (
  `idDoenca` INT NOT NULL AUTO_INCREMENT,
  `nomeDoenca` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idDoenca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_doencas_has_tbl_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_doencas_has_tbl_funcionario` (
  `tbl_Doencas_idDoenca` INT NOT NULL,
  `tbl_funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`tbl_Doencas_idDoenca`, `tbl_funcionario_idFuncionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_doencas_has_tbl_funcionario 
ADD CONSTRAINT `fk_tbl_Doencas_has_tbl_funcionario_tbl_Doencas1`
FOREIGN KEY (`tbl_Doencas_idDoenca`) 
REFERENCES `controle_pessoas`.`tbl_doencas` (`idDoenca`);

ALTER TABLE tbl_doencas_has_tbl_funcionario 
ADD CONSTRAINT `fk_tbl_Doencas_has_tbl_funcionario_tbl_funcionario1`
FOREIGN KEY (`tbl_funcionario_idFuncionario`) 
REFERENCES `controle_pessoas`.`tbl_funcionario` (`idFuncionario`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_exames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_exames` (
  `idExame` INT NOT NULL AUTO_INCREMENT,
  `dataExame` DATETIME NOT NULL,
  `nomeExame` VARCHAR(500) NOT NULL,
  `valorReferencia` VARCHAR(500) NULL DEFAULT NULL,
  `idFuncionario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idExame`))
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_exames 
ADD CONSTRAINT `fk_Exames_Funcionario`
FOREIGN KEY (`idFuncionario`) 
REFERENCES `controle_pessoas`.`tbl_funcionario` (`idFuncionario`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_laudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_laudo` (
  `idLaudo` INT NOT NULL AUTO_INCREMENT,
  `resultado` VARCHAR(500) NOT NULL,
  `estaApto` TINYINT(1) NOT NULL,
  `tbl_exames_idExame` INT NOT NULL,
  PRIMARY KEY (`idLaudo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_laudo 
ADD CONSTRAINT `fk_tbl_laudo_tbl_exames1`
FOREIGN KEY (`tbl_exames_idExame`) 
REFERENCES `controle_pessoas`.`tbl_exames` (`idExame`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_necessidadesespeciais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_necessidadesespeciais` (
  `idNecessidadeEspecial` INT NOT NULL AUTO_INCREMENT,
  `nomeNecessidadeEspecial` VARCHAR(500) NULL DEFAULT NULL,
  `idFuncionario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idNecessidadeEspecial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_necessidadesespeciais 
ADD CONSTRAINT `fk_Necessidades_Especiais_Funcionario`
FOREIGN KEY (`idFuncionario`) 
REFERENCES `controle_pessoas`.`tbl_funcionario` (`idFuncionario`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_setor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_setor` (
  `idSetor` INT NOT NULL,
  `nomeSetor` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idSetor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_Ferias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_Ferias` (
  `idFerias` INT NOT NULL AUTO_INCREMENT,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,  
  `qtde_dias` INT NULL,
  `tbl_funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idFerias`))
ENGINE = InnoDB;

ALTER TABLE tbl_Ferias 
ADD CONSTRAINT `fk_tbl_Ferias_tbl_funcionario1`
FOREIGN KEY (`tbl_funcionario_idFuncionario`) 
REFERENCES `controle_pessoas`.`tbl_funcionario` (`idFuncionario`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_telefones` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(500) NOT NULL,
  `idFuncionario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idTelefone`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_telefones 
ADD CONSTRAINT `fk_Telefone_Funcionario`
FOREIGN KEY (`idFuncionario`) 
REFERENCES `controle_pessoas`.`tbl_funcionario` (`idFuncionario`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_curriculo_has_tbl_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_curriculo_has_tbl_cursos` (
  `tbl_curriculo_idCurriculo` INT NOT NULL,
  `tbl_cursos_idCurso` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NOT NULL,
  PRIMARY KEY (`tbl_curriculo_idCurriculo`, `tbl_cursos_idCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_curriculo_has_tbl_cursos 
ADD CONSTRAINT `fk_tbl_curriculo_has_tbl_cursos_tbl_curriculo1`
FOREIGN KEY (`tbl_curriculo_idCurriculo`) 
REFERENCES `controle_pessoas`.`tbl_curriculo` (`idCurriculo`);

ALTER TABLE tbl_curriculo_has_tbl_cursos 
ADD CONSTRAINT `fk_tbl_curriculo_has_tbl_cursos_tbl_cursos1`
FOREIGN KEY (`tbl_cursos_idCurso`) 
REFERENCES `controle_pessoas`.`tbl_cursos` (`idCurso`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_Competencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_Competencia` (
  `idCompetencia` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idCompetencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_funcionario_has_tbl_setor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_funcionario_has_tbl_setor` (
  `tbl_funcionario_idFuncionario` INT NOT NULL,
  `tbl_setor_idSetor` INT NOT NULL,
  `dataEntrada` DATE NOT NULL,
  `dataSaida` DATE NULL,
  PRIMARY KEY (`tbl_funcionario_idFuncionario`, `tbl_setor_idSetor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_funcionario_has_tbl_setor 
ADD CONSTRAINT `fk_tbl_funcionario_has_tbl_setor_tbl_funcionario1`
FOREIGN KEY (`tbl_funcionario_idFuncionario`) 
REFERENCES `controle_pessoas`.`tbl_funcionario` (`idFuncionario`);

ALTER TABLE tbl_funcionario_has_tbl_setor 
ADD CONSTRAINT `fk_tbl_funcionario_has_tbl_setor_tbl_setor1`
FOREIGN KEY (`tbl_setor_idSetor`) 
REFERENCES `controle_pessoas`.`tbl_setor` (`idSetor`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_cursos_has_tbl_Competencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_cursos_has_tbl_Competencia` (
  `tbl_cursos_idCurso` INT NOT NULL,
  `tbl_Competencia_idCompetencia` INT NOT NULL,
  PRIMARY KEY (`tbl_cursos_idCurso`, `tbl_Competencia_idCompetencia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_cursos_has_tbl_Competencia 
ADD CONSTRAINT `fk_tbl_cursos_has_tbl_Competencia_tbl_cursos1`
FOREIGN KEY (`tbl_cursos_idCurso`) 
REFERENCES `controle_pessoas`.`tbl_cursos` (`idCurso`);

ALTER TABLE tbl_cursos_has_tbl_Competencia 
ADD CONSTRAINT `fk_tbl_cursos_has_tbl_Competencia_tbl_Competencia1`
FOREIGN KEY (`tbl_Competencia_idCompetencia`) 
REFERENCES `controle_pessoas`.`tbl_Competencia` (`idCompetencia`);

-- -----------------------------------------------------
-- Table `controle_pessoas`.`tbl_funcao_has_tbl_Competencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controle_pessoas`.`tbl_funcao_has_tbl_Competencia` (
  `tbl_funcao_idFuncao` INT NOT NULL,
  `tbl_Competencia_idCompetencia` INT NOT NULL,
  PRIMARY KEY (`tbl_funcao_idFuncao`, `tbl_Competencia_idCompetencia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE tbl_funcao_has_tbl_Competencia 
ADD CONSTRAINT `fk_tbl_funcao_has_tbl_Competencia_tbl_funcao1`
FOREIGN KEY (`tbl_funcao_idFuncao`) 
REFERENCES `controle_pessoas`.`tbl_funcao` (`idFuncao`);

ALTER TABLE tbl_funcao_has_tbl_Competencia 
ADD CONSTRAINT `fk_tbl_funcao_has_tbl_Competencia_tbl_Competencia1`
FOREIGN KEY (`tbl_Competencia_idCompetencia`) 
REFERENCES `controle_pessoas`.`tbl_Competencia` (`idCompetencia`);

INSERT INTO controle_pessoas.tbl_funcao (nomeFuncao) VALUES
('Gerente'),
('Analista de RH'),
('Desenvolvedor'),
('Assistente Administrativo'),
('Designer'),
('Analista Financeiro'),
('Coordenador de Vendas'),
('Técnico de Suporte'),
('Analista de Marketing'),
('Auxiliar de Recursos Humanos');

-- Inserção de dados adicionais na tabela tbl_curriculo
INSERT INTO controle_pessoas.tbl_curriculo (nivelEscolaridade) VALUES
('Ensino Fundamental Completo'),
('Ensino Médio Incompleto'),
('Ensino Médio Completo'),
('Graduação em Andamento'),
('Graduação Completa'),
('Pós-Graduação em Andamento'),
('Pós-Graduação Completa'),
('Mestrado em Andamento'),
('Mestrado Completo'),
('Doutorado em Andamento');

-- Inserção de dados adicionais na tabela tbl_cursos
INSERT INTO controle_pessoas.tbl_cursos (nomeCurso, cargaHoraria) VALUES
('Curso de Liderança', 40),
('Curso de Gestão de Projetos', 60),
('Curso de Java Avançado', 80),
('Curso de Atendimento ao Cliente', 30),
('Curso de Design Gráfico', 50),
('Curso de Contabilidade Básica', 45),
('Curso de Vendas Estratégicas', 70),
('Curso de Redes de Computadores', 65),
('Curso de Marketing Digital', 55),
('Curso de Assistente Administrativo', 35);

-- Inserção de dados na tabela tbl_funcionario para 10 funcionários
INSERT INTO controle_pessoas.tbl_funcionario 
(estado_civil,primeiroNomeFuncionario, segundoNomeFuncionario,tipoSanguineo, doadorOrgaos, endLogradouro, endComplemento, endCEP, endNumero, tbl_funcao_idFuncao, tbl_curriculo_idCurriculo) 
VALUES
('Solteiro','João', 'Silva', 'A+', 1, 'Rua Principal, 123', 'Apto 45', '12345678', '123', 1, 3),
( 'Casado','Maria', 'Santos', 'B-', 0, 'Avenida Central, 456', NULL, '98765432', '456', 2, 5),
('Solteiro','Carlos', 'Oliveira', 'O+', 1, 'Rua Secundária, 789', 'Bloco C', '54321876', '789', 3, 7),
( 'Casado','Fernanda', 'Lima',  'AB-', 0, 'Travessa Lateral, 321', 'Casa 7', '87654321', '321', 4, 2),
('Solteiro','Rafael', 'Martins', 'B+', 1, 'Alameda dos Fundos, 567', NULL, '23456789', '567', 5, 8),
( 'Casado','Ana', 'Pereira', 'A-', 0, 'Avenida dos Fundos, 876', 'Bloco D', '87654987', '876', 6, 10),
('Solteiro','Pedro', 'Ferreira', 'AB+', 1, 'Rua dos Corredores, 987', 'Casa 12', '34567890', '987', 7, 1),
('Viúva','Mariana', 'Costa',  'O-', 0, 'Avenida Lateral, 234', 'Apto 21', '67890123', '234', 8, 6),
('Solteiro','Lucas', 'Almeida', 'B+', 1, 'Rua da Esquina, 789', NULL, '54321098', '789', 9, 4),
('Viúva','Gabriela', 'Rocha', 'A+', 1, 'Rua do Centro, 345', 'Sala 15', '89012345', '345', 10, 9);

-- Inserção de dados adicionais na tabela tbl_dependentes
INSERT INTO controle_pessoas.tbl_dependentes 
(primeiroNomeDependente, segundoNomeDependente, dataNascimento, universitario, tipoDependencia, idFuncionario) 
VALUES
('Joãozinho', 'Silva', '2005-03-15', 0, 'Filho', 1),
('Mariana', 'Santos', '2010-08-20', 1, 'Filha', 2),
('Pedrinho', 'Oliveira', '2013-05-10', 0, 'Filho', 3),
('Fernandinha', 'Lima', '2018-02-28', 0, 'Filha', 4),
('Rafaelzinho', 'Martins', '2016-11-12', 1, 'Filho', 5),
('Ana Júlia', 'Pereira', '2019-07-03', 0, 'Filha', 6),
('Paulinho', 'Ferreira', '2011-09-25', 1, 'Filho', 7),
('Marcela', 'Costa', '2017-04-18', 0, 'Filha', 8),
('Luquinhas', 'Almeida', '2014-12-07', 0, 'Filho', 9),
('Gabriel', 'Rocha', '2015-06-30', 1, 'Filho', 10);

-- Inserção de dados adicionais na tabela tbl_doencas
INSERT INTO controle_pessoas.tbl_doencas (nomeDoenca) VALUES
('Hipertensão'),
('Diabetes'),
('Asma'),
('Alergia a Frutos do Mar'),
('Depressão'),
('Enxaqueca'),
('Artrite'),
('Lúpus'),
('Hemofilia'),
('Doença de Crohn');

-- Inserção de dados adicionais na tabela tbl_doencas_has_tbl_funcionario
INSERT INTO controle_pessoas.tbl_doencas_has_tbl_funcionario (tbl_Doencas_idDoenca, tbl_funcionario_idFuncionario) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserção de dados adicionais na tabela tbl_exames
INSERT INTO controle_pessoas.tbl_exames 
(dataExame, nomeExame, valorReferencia, idFuncionario) 
VALUES
('2022-01-10 08:00:00', 'Hemograma Completo', 'Normal', 1),
('2022-02-15 09:30:00', 'Colesterol Total', '150-200 mg/dL', 2),
('2022-03-20 10:45:00', 'Glicose em Jejum', '70-100 mg/dL', 3),
('2022-04-25 11:15:00', 'Pressão Arterial', '120/80 mmHg', 4),
('2022-05-30 13:30:00', 'Função Hepática', 'Normal', 5),
('2022-06-05 14:45:00', 'Teste de Função Pulmonar', 'Normal', 6),
('2022-07-10 16:00:00', 'Ácido Úrico', '2.6-6.0 mg/dL', 7),
('2022-08-15 17:30:00', 'Hemoglobina Glicada', '4-5.6%', 8),
('2022-09-20 18:15:00', 'Contagem de Plaquetas', '150,000-450,000/uL', 9),
('2022-10-25 19:45:00', 'Eletrocardiograma', 'Normal', 10);

-- Inserção de dados adicionais na tabela tbl_laudo
INSERT INTO controle_pessoas.tbl_laudo (resultado, estaApto, tbl_exames_idExame) VALUES
('Normal', 1, 1),
('Normal', 1, 2),
('Normal', 1, 3),
('Normal', 1, 4),
('Normal', 1, 5),
('Normal', 1, 6),
('Normal', 1, 7),
('Normal', 0, 8),
('Normal', 0, 9),
('Normal', 0, 10);

-- Inserção de dados adicionais na tabela tbl_necessidadesespeciais
INSERT INTO controle_pessoas.tbl_necessidadesespeciais (nomeNecessidadeEspecial, idFuncionario) VALUES
('Cadeirante', 1),
('Deficiência Visual', 2),
('Deficiência Auditiva', 3),
('Deficiência Mental', 4),
('Autismo', 5),
('Síndrome de Down', 6),
('Surdez', 7),
('Mobilidade Reduzida', 8),
('Alergia a Glúten', 9),
('Alergia a Lactose', 10);

-- Inserção de dados adicionais na tabela tbl_setor
INSERT INTO controle_pessoas.tbl_setor (idSetor, nomeSetor) VALUES
(1, 'RH'),
(2, 'Financeiro'),
(3, 'TI'),
(4, 'Administrativo'),
(5, 'Marketing');

-- Inserção de dados adicionais na tabela tbl_Ferias
INSERT INTO controle_pessoas.tbl_Ferias 
(data_inicio, data_fim, qtde_dias, tbl_funcionario_idFuncionario) 
VALUES
('2022-11-01', '2022-11-15', 15, 1),
('2022-12-10', '2022-12-25', 16, 2),
('2023-01-05', '2023-01-15', 11, 3),
('2023-02-20', '2023-03-05', 14, 4),
('2023-04-01', '2023-04-15', 15, 5),
('2023-05-10', '2023-05-20', 11, 6),
('2023-06-15', '2023-06-30', 16, 7),
('2023-07-10', '2023-07-25', 16, 8),
('2023-08-05', '2023-08-15', 11, 9),
('2023-09-20', '2023-10-05', 16, 10);

-- Inserção de dados adicionais na tabela tbl_telefones
INSERT INTO controle_pessoas.tbl_telefones (numero, idFuncionario) VALUES
('1234-5678', 1),
('9876-5432', 2),
('5432-1098', 3),
('8765-4321', 4),
('2345-6789', 5),
('6543-2109', 6),
('8765-4987', 7),
('3456-7890', 8),
('9876-5432', 9),
('1234-5678', 10);

INSERT INTO tbl_competencia(nome) VALUES ('Competência 01');
INSERT INTO tbl_competencia(nome) VALUES ('Competência 02');
INSERT INTO tbl_competencia(nome) VALUES ('Competência 03');
INSERT INTO tbl_competencia(nome) VALUES ('Competência 04');
INSERT INTO tbl_competencia(nome) VALUES ('Competência 05');
INSERT INTO tbl_competencia(nome) VALUES ('Competência 06');
INSERT INTO tbl_competencia(nome) VALUES ('Competência 07');
INSERT INTO tbl_competencia(nome) VALUES ('Competência 08');
INSERT INTO tbl_competencia(nome) VALUES ('Competência 09');
INSERT INTO tbl_competencia(nome) VALUES ('Competência 10');

-- Inserção de dados adicionais na tabela tbl_curriculo_has_tbl_cursos
INSERT INTO controle_pessoas.tbl_curriculo_has_tbl_cursos 
(tbl_curriculo_idCurriculo, tbl_cursos_idCurso, data_inicio, data_fim) 
VALUES
(1, 1, '2020-01-01', '2020-02-01'),
(2, 2, '2019-03-01', '2019-05-01'),
(3, 3, '2021-06-01', '2021-09-01'),
(4, 4, '2018-02-01', '2019-01-01'),
(5, 5, '2017-04-01', '2018-01-01'),
(6, 6, '2020-08-01', '2020-11-01'),
(7, 7, '2019-02-01', '2019-07-01'),
(8, 8, '2018-06-01', '2018-09-01'),
(9, 9, '2021-11-01', '2022-01-01'),
(10, 10, '2016-12-01', '2017-02-01');

-- Inserção de dados adicionais na tabela tbl_cursos_has_tbl_Competencia
INSERT INTO controle_pessoas.tbl_cursos_has_tbl_Competencia 
(tbl_cursos_idCurso, tbl_Competencia_idCompetencia) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserção de dados adicionais na tabela tbl_funcao_has_tbl_Competencia
INSERT INTO controle_pessoas.tbl_funcao_has_tbl_Competencia 
(tbl_funcao_idFuncao, tbl_Competencia_idCompetencia) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserção de dados na tabela tbl_funcionario_has_tbl_setor
INSERT INTO controle_pessoas.tbl_funcionario_has_tbl_setor 
(tbl_funcionario_idFuncionario, tbl_setor_idSetor, dataEntrada, dataSaida) 
VALUES
(1, 1, '2022-01-01', NULL),
(2, 2, '2022-01-01', NULL),
(3, 3, '2022-01-01', NULL),
(4, 4, '2022-01-01', NULL),
(5, 5, '2022-01-01', NULL),
(6, 1, '2022-01-01', NULL),
(7, 2, '2022-01-01', NULL),
(8, 3, '2022-01-01', NULL),
(9, 4, '2022-01-01', NULL),
(10, 5, '2022-01-01', NULL);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;