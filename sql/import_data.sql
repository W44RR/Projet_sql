DROP TABLE IF EXISTS vehicule_import;

CREATE TABLE vehicule_import (
    id INT,
    marque TEXT,
    modele TEXT,
    annee INT,
    energie TEXT,
    autonomie_km INT,
    immatriculation TEXT,
    etat TEXT,
    localisation TEXT
);


INSERT INTO station (ville)
SELECT DISTINCT localisation
FROM vehicule_import
WHERE localisation NOT IN (SELECT ville FROM station);

INSERT INTO vehicule (
    id_vehicule,
    marque,
    modele,
    annee,
    energie,
    autonomie_km,
    immatriculation,
    statut,
    id_station
)
SELECT
    vi.id,
    vi.marque,
    vi.modele,
    vi.annee,
    vi.energie,
    vi.autonomie_km,
    vi.immatriculation,
    vi.etat,
    s.id_station
FROM vehicule_import vi
JOIN station s ON s.ville = vi.localisation;
