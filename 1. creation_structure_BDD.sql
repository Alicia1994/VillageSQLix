-- création de la BDD SQlix
CREATE DATABASE SQlix ;

-- création table province
CREATE TABLE province  (
  num_province INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom_province VARCHAR(30) NOT NULL DEFAULT '',
  nom_gouverneur VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB;

-- création table categorie
CREATE TABLE categorie  (
  code_cat CHAR (3) PRIMARY KEY NOT NULL,
  nom_categ VARCHAR(50),
  nb_points INT
) ENGINE=InnoDB ;



-- création table potion
CREATE TABLE potion (
  num_potion INT PRIMARY KEY AUTO_INCREMENT,
  lib_potion VARCHAR(40),
  formule VARCHAR(30),
  constituant_principal VARCHAR(30)
) ENGINE=InnoDB ;

-- création table village
CREATE TABLE village  (
  num_village INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom_village VARCHAR(30) NOT NULL DEFAULT '',
  nb_huttes INT NOT NULL DEFAULT 0,
  num_province INT NOT NULL,
  CONSTRAINT FOREIGN KEY (num_province) REFERENCES province (num_province)
) ENGINE=InnoDB;

-- création table resserre
CREATE TABLE resserre (
  num_resserre INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom_resserre VARCHAR(30) NOT NULL DEFAULT '',
  superficie INT NOT NULL DEFAULT 0,
  num_village INT NOT NULL,
  CONSTRAINT FOREIGN KEY (num_village) REFERENCES village (num_village)
) ENGINE=InnoDB;


-- création table qualite
CREATE TABLE qualite  (
  num_qualite INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  lib_qualite VARCHAR(30)
) ENGINE=InnoDB;

-- création table habitant
CREATE TABLE habitant (
  num_hab INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  nom VARCHAR(30),
  age INT,
  num_qualite INT,
  num_village INT,
  CONSTRAINT FOREIGN KEY (num_qualite) REFERENCES qualite (num_qualite),
  CONSTRAINT FOREIGN KEY (num_village) REFERENCES village (num_village)
) ENGINE=InnoDB;

-- création table trophee 
CREATE TABLE trophee  (
  num_trophee INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  date_prise DATETIME NOT NULL,
  code_cat CHAR(3),
  num_preneur INT,
  num_resserre INT,
  CONSTRAINT FOREIGN KEY (num_preneur) REFERENCES habitant (num_hab),
  CONSTRAINT FOREIGN KEY (num_resserre) REFERENCES resserre(num_resserre),
  CONSTRAINT FOREIGN KEY (code_cat) REFERENCES categorie (code_cat)
) ENGINE=InnoDB ;


-- création table absorber
CREATE TABLE absorber  (
  num_potion INT,
  date_a DATETIME,
  num_hab INT,
  quantite INT,
  PRIMARY KEY (date_a, num_potion, num_hab), 
  CONSTRAINT FOREIGN KEY (num_hab) REFERENCES habitant (num_hab),
  CONSTRAINT FOREIGN KEY (num_potion) REFERENCES potion (num_potion)
) ENGINE=InnoDB;


-- création table fabriquer
CREATE TABLE fabriquer (
    num_potion INT ,
    num_hab INT ,  
    PRIMARY KEY (num_potion , num_hab),
    CONSTRAINT FOREIGN KEY (num_hab) REFERENCES habitant(num_hab),
    CONSTRAINT FOREIGN KEY (num_potion) REFERENCES potion(num_potion)
)ENGINE INNODB; 

ALTER TABLE `fabriquer` ADD INDEX(`num_potion`);

-- --Script creation procedure de sauvegarde : mysqldump -u root -h localhost -p --databases SQlix --result-file=/Users/aliciaderradji/Desktop/save/SQlixsave.sql