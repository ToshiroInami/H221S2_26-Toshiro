-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-12-14 00:35:18.97

-- tables
-- Table: APODERADO
CREATE TABLE APODERADO (
    CODAPO char(6) NOT NULL COMMENT 'Contiene el Código del Apoderado.',
    NOMAPO varchar(60) NOT NULL COMMENT 'Contiene el Nombre del Apoderado.',
    APEAPO varchar(60) NOT NULL COMMENT 'Contiene el Apellido del Apoderado.',
    DNIAPO char(8) NOT NULL COMMENT 'Contiene el DNI del Apoderado.',
    DIRAPO varchar(60) NOT NULL COMMENT 'Contiene la Dirección del Apoderado.',
    DISAPO varchar(60) NOT NULL COMMENT 'Contiene el Distrito del Apoderado.',
    PROAPO varchar(60) NOT NULL COMMENT 'Contiene la Provincia del Apoderado.',
    DEPAPO varchar(60) NOT NULL COMMENT 'Contiene el Departamento del Apoderado.',
    CELAPO char(9) NOT NULL COMMENT 'Contiene el Celular del Apoderado.',
    EMAAPO varchar(60) NOT NULL COMMENT 'Contiene el Email del Apoderado.',
    SEXAPO Char(1) NOT NULL COMMENT 'Contiene el Sexo (M-F) del Apoderado.',
    CODUBI Char(6) NOT NULL COMMENT 'Contiene los datos de ubigeos del Apoderado y el Estudiante.',
    CONSTRAINT APODERADO_pk PRIMARY KEY (CODAPO)
) COMMENT 'Contiene los datos relacionados al Apoderado.';

-- Table: ENCARGADO
CREATE TABLE ENCARGADO (
    CODENC char(6) NOT NULL COMMENT 'Contiene el Código del Encargado.',
    NOMENC Varchar(60) NOT NULL COMMENT 'Contiene el Nombre del Encargado.',
    APEENC Varchar(60) NOT NULL COMMENT 'Contiene el Apellido del Encargado.',
    DNIENC char(8) NOT NULL COMMENT 'Contiene el DNI del Encargado.',
    DIREENC Varchar(60) NOT NULL COMMENT 'Contiene el Dirección del Encargado.',
    DISENC Varchar(60) NOT NULL COMMENT 'Contiene el Distrito del Encargado.',
    PROENC Varchar(60) NOT NULL COMMENT 'Contiene el Provincia del Encargado..',
    DEPENC Varchar(60) NOT NULL COMMENT 'Contiene el Departamento del Encargado..',
    CELENC Char(9) NOT NULL COMMENT 'Contiene el Celular del Encargado.',
    EMAENC Varchar(60) NOT NULL COMMENT 'Contiene el Email del Encargado.',
    SEXENC Char(1) NOT NULL COMMENT 'Contiene el Sexo(M-F) del Encargado.',
    CONSTRAINT ENCARGADO_pk PRIMARY KEY (CODENC)
) COMMENT 'Contiene los datos de la Encargado.';

-- Table: ESTUDIANTE
CREATE TABLE ESTUDIANTE (
    CODEST char(6) NOT NULL COMMENT 'Contiene el Código del Estudiante.',
    NOMEST varchar(60) NOT NULL COMMENT 'Contiene el Nombre del Estudiante.',
    APEEST varchar(60) NOT NULL COMMENT 'Contiene el Apellido del Estudiante.',
    DNIEST char(8) NOT NULL COMMENT 'Contiene el DNI del Estudiante.',
    CELEST char(9) NOT NULL COMMENT 'Contiene el número celular del Estudiante.',
    DIREST varchar(60) NOT NULL COMMENT 'Contiene la Dirección del Estudiante.',
    DISEST Varchar(80) NOT NULL COMMENT 'Contiene el Distrito del Estudiante.',
    PROEST Varchar(80) NOT NULL COMMENT 'Contiene la Provincia del Estudiante.',
    DEPEST Varchar(80) NOT NULL COMMENT 'Contiene el Departamento del Estudiante.',
    FECNACEST date NOT NULL COMMENT 'Contiene la Fecha de Nacimiento del Estudiante.',
    EMAEST varchar(60) NOT NULL COMMENT 'Contiene el Email del Estudiante.',
    SEXEST Char(1) NOT NULL COMMENT 'Contiene el Sexo(M-F) del Apoderado.',
    CODUBI Char(6) NOT NULL COMMENT 'Contiene los datos de ubigeos del Apoderado y el Estudiante.',
    CONSTRAINT ESTUDIANTE_pk PRIMARY KEY (CODEST)
) COMMENT 'Contiene los datos del Estudiante.';

-- Table: MATRICULA
CREATE TABLE MATRICULA (
    IDMAT char(6) NOT NULL COMMENT 'Contiene el ID de la Matrícula.',
    CODAPO char(6) NOT NULL COMMENT 'Contiene el Código del Apoderado.',
    CODEST char(6) NOT NULL COMMENT 'Contiene el Código del Estudiante.',
    CODUBI Char(6) NOT NULL COMMENT 'Contiene el codigo de consultas de Matrículas.',
    CODENC char(6) NOT NULL COMMENT 'Contiene el Código del Encargado.',
    COSMAT decimal(8,2) NOT NULL COMMENT 'Contiene el Costo de la matricula',
    DIAMAT date NOT NULL COMMENT 'Contiene el Dia de la Matricula.',
    HORMAT time NOT NULL COMMENT 'Contiene la Hora de la Matricula.',
    CONSTRAINT MATRICULA_pk PRIMARY KEY (IDMAT)
) COMMENT 'Contiene los datos de la matricula
';

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI Char(6) NOT NULL COMMENT 'Contiene los datos de ubigeos del Apoderado y el Estudiante.',
    DEPUBI Varchar(80) NOT NULL COMMENT 'Contiene el Departamento del Apoderado y el Estudiante.',
    PROUBI Varchar(80) NOT NULL COMMENT 'Contiene el Provincia del Apoderado y el Estudiante.',
    DISUBI Varchar(80) NOT NULL COMMENT 'Contiene el Distrito del Apoderado y el Estudiante.',
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
) COMMENT 'Contiene los datos de ubigeos del Apoderado y el Estudiante.';

-- foreign keys
-- Reference: APODERADO_UBIGEO (table: APODERADO)
ALTER TABLE APODERADO ADD CONSTRAINT APODERADO_UBIGEO FOREIGN KEY APODERADO_UBIGEO (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: ESTUDIANTE_UBIGEO (table: ESTUDIANTE)
ALTER TABLE ESTUDIANTE ADD CONSTRAINT ESTUDIANTE_UBIGEO FOREIGN KEY ESTUDIANTE_UBIGEO (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: MATRICULA_APODERADO (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_APODERADO FOREIGN KEY MATRICULA_APODERADO (CODAPO)
    REFERENCES APODERADO (CODAPO);

-- Reference: MATRICULA_ESTUDIANTE (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_ESTUDIANTE FOREIGN KEY MATRICULA_ESTUDIANTE (CODEST)
    REFERENCES ESTUDIANTE (CODEST);

-- Reference: MATRICULA_SECRETARIA (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_SECRETARIA FOREIGN KEY MATRICULA_SECRETARIA (CODENC)
    REFERENCES ENCARGADO (CODENC);

-- Reference: MATRICULA_UBIGEO (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_UBIGEO FOREIGN KEY MATRICULA_UBIGEO (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- End of file.

