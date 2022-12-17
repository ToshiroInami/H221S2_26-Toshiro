CREATE DATABASE registrate;
USE registrate;
DROP TABLE IF EXISTS educando;
CREATE TABLE educando
(
    CODEDU INT AUTO_INCREMENT PRIMARY KEY ,
    DNIEDU CHAR(8) NOT NULL,
    NOMEDU VARCHAR(60) NOT NULL,
    APEEDU VARCHAR(60) NOT NULL,
    SEXEDU CHAR(1) NOT NULL,
    TELEDU CHAR(9) NOT NULL,
	GRAEDU VARCHAR(70) NOT NULL
    );

/* MODIFICAMOS EL CAMPO DISEDU*/

/* MODIFICAMOS EL CAMPO SEXCLI PARA QUE ACEPTE CONDICIONES DE SUS VALORES */
ALTER TABLE educando
    ADD CONSTRAINT SEXO_VALIDO CHECK(SEXEDU = 'M' OR SEXEDU = 'F');
    
SHOW COLUMNS IN educando;


INSERT INTO educando
(DNIEDU, NOMEDU, APEEDU, SEXEDU, TELEDU, GRAEDU)
VALUES
('77889955', 'ALBERTO', 'SOLANO PARIONA', 'M', '929293392', 'SECUNDARIA');

SELECT*FROM educando;