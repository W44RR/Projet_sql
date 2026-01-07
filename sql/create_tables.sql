CREATE TABLE station (
    id_station SERIAL PRIMARY KEY,
    ville VARCHAR(50) NOT NULL,
    nb_bornes INT CHECK (nb_bornes >= 0)
);

CREATE TABLE vehicule (
    id_vehicule INT PRIMARY KEY,
    marque VARCHAR(50) NOT NULL,
    modele VARCHAR(50) NOT NULL,
    annee INT CHECK (annee >= 2015),
    energie VARCHAR(20) CHECK (energie = 'Electrique'),
    autonomie_km INT CHECK (autonomie_km > 0),
    immatriculation VARCHAR(15) UNIQUE NOT NULL,
    statut VARCHAR(30) NOT NULL,
    id_station INT REFERENCES station(id_station)
);

CREATE TABLE client (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    date_inscription DATE DEFAULT CURRENT_DATE
);

CREATE TABLE location (
    id_location SERIAL PRIMARY KEY,
    date_debut TIMESTAMP NOT NULL,
    date_fin TIMESTAMP,
    id_client INT REFERENCES client(id_client),
    id_vehicule INT REFERENCES vehicule(id_vehicule),
    cout_total NUMERIC(8,2)
);

CREATE TABLE paiement (
    id_paiement SERIAL PRIMARY KEY,
    date_paiement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    montant NUMERIC(8,2) NOT NULL,
    moyen_paiement VARCHAR(30),
    id_location INT UNIQUE REFERENCES location(id_location)
);

CREATE TABLE maintenance (
    id_maintenance SERIAL PRIMARY KEY,
    date_intervention DATE NOT NULL,
    type_intervention VARCHAR(100),
    id_vehicule INT REFERENCES vehicule(id_vehicule)
);
