-- création de l'utilisateur 
CREATE USER "sqlix_u"@"localhost" IDENTIFIED BY "sqlix_187356*";

-- ajout des privilèges
GRANT SELECT, INSERT, UPDATE, DELETE ON SQlix.* TO "sqlix_u"@"localhost";