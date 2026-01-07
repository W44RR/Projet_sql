# Projet SQL B2 - cIAra Mobility

## Contexte
Gestion d'une flotte de véhicules électriques partagés (voitures, scooters, trottinettes, vélos) pour la start-up Clara Mobility.

## Tables créées
- `station` : stocke les stations avec leur ville
- `vehicule` : informations sur les véhicules
- `maintenance` : interventions de maintenance sur les véhicules

## Import des données
- Stations : manuellement dans `import_data.sql`
- Véhicules : import depuis CSV via COPY

## Requêtes principales
- Nombre de véhicules disponibles
- Autonomie moyenne par marque
- Véhicules par ville
- Vues pour simplifier l’accès aux véhicules disponibles
- Fonction pour calculer le coût d’une location
- Trigger pour mettre à jour automatiquement le statut lors d’une maintenance

## Utilisation
1. Exécuter `create_tables.sql`
2. Exécuter `import_data.sql`
3. Exécuter `queries.sql`
4. Tester SELECT / VUE / FONCTION / TRIGGER