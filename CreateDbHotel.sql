DROP DATABASE IF EXISTS hotel_gestion;
CREATE DATABASE hotel_gestion;


CREATE TABLE Client(
   Num_Client INT,
   Nom VARCHAR(255) NOT NULL,
   Prenom VARCHAR(255) NOT NULL,
   N__de_CB INT,
   N__de_telephone INT NOT NULL,
   Adresse_Mail VARCHAR(255) NOT NULL,
   Date_Naissance DATE NOT NULL,
   PRIMARY KEY(Num_Client)
);

CREATE TABLE Enseigne(
   ID_Enseigne INT,
   Nom_Enseigne VARCHAR(255) NOT NULL,
   PRIMARY KEY(ID_Enseigne)
);

CREATE TABLE Pays(
   ID_Pays INT,
   Nom_Pays VARCHAR(255) NOT NULL,
   Devise VARCHAR(255) NOT NULL,
   PRIMARY KEY(ID_Pays)
);

CREATE TABLE Adresse(
   ID_Adresse INT,
   N__de_rue INT,
   Nom_de_la_rue VARCHAR(255),
   Code_Postal INT,
   ID_Pays INT NOT NULL,
   PRIMARY KEY(ID_Adresse),
   FOREIGN KEY(ID_Pays) REFERENCES Pays(ID_Pays)
);

CREATE TABLE Facture(
   Num_Facture INT,
   Montant float4 NOT NULL,
   PRIMARY KEY(Num_Facture)
);

CREATE TABLE Hotel(
   ID_Hotel INT,
   Nombre_etoile INT,
   ID_Adresse INT NOT NULL,
   ID_Enseigne INT NOT NULL,
   PRIMARY KEY(ID_Hotel),
   FOREIGN KEY(ID_Adresse) REFERENCES Adresse(ID_Adresse),
   FOREIGN KEY(ID_Enseigne) REFERENCES Enseigne(ID_Enseigne)
);

CREATE TABLE Chambre(
   Code_Chambre INT,
   Niveau_de_confort INT NOT NULL,
   Nombre_de_lit INT NOT NULL,
   ID_Hotel INT NOT NULL,
   PRIMARY KEY(Code_Chambre),
   FOREIGN KEY(ID_Hotel) REFERENCES Hotel(ID_Hotel)
);

CREATE TABLE Sejour(
   Num_Client INT,
   Code_Chambre INT,
   Num_Facture INT,
   Num_Reservation INT NOT NULL,
   Date_debut DATE NOT NULL,
   Date_fin DATE,
   Niveau_de_confort_appliqué VARCHAR(50) NOT NULL,
   Options VARCHAR(50),
   PRIMARY KEY(Num_Client, Code_Chambre, Num_Facture),
   UNIQUE(Num_Reservation),
   UNIQUE(Date_debut),
   FOREIGN KEY(Num_Client) REFERENCES Client(Num_Client),
   FOREIGN KEY(Code_Chambre) REFERENCES Chambre(Code_Chambre),
   FOREIGN KEY(Num_Facture) REFERENCES Facture(Num_Facture)
);
