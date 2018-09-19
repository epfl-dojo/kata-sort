
<b>Travail en cours ! Contributions, commentaires et autres propositions d'améliorations bienvenues !</b>

# Kata Sort
Le but de ce kata est d'explorer différents algorithmes de tri.

## Documentation / Liens
  * La page Wikipédia: https://fr.wikipedia.org/wiki/Algorithme_de_tri
  * Explication et gif animés: https://web.archive.org/web/20150309073910/http://www.sorting-algorithms.com:80/reversed-initial-order  
                               https://www.toptal.com/developers/sorting-algorithms
  * 24 algorithmes de tri visualisés: https://www.youtube.com/watch?v=BeoCbJPuvSE
  * Bubble Sort dance: https://www.youtube.com/watch?v=lyZQPjUT5B4
  * https://opendata.stackexchange.com/questions/5737/series-of-integers-to-test-sorting-algorithms
  * https://en.m.wikipedia.org/wiki/A_Million_Random_Digits_with_100,000_Normal_Deviates
  * https://ieeexplore.ieee.org/document/7280062/

## Comment procéder
[Forker](https://github.com/epfl-dojo/kata-sort/#fork-destination-box) le repo
et créer une branche (`git checkout -b username-langage` par exemple `git
checkout -b ponsfrilus-nodejs`, depuis votre fork). Faire ensuite une pull
request pour l'ajouter à ce repo en vous ajoutant comme contributeurs en bas de
ce fichier.

## Problème
Le but de ce kata est de comprendre le fonctionnement des algorithmes de tri
(par comparaisons) et de ne pas utiliser les fonctions "built-in" du langages.
Il est nécessaire de chronométrer le temps nécessaire au tri de chaque tableau. 

### Données de départ
Les données à trier sont quatre tableaux générés par le script
[./generate_data.sh](generate_data.sh):
  * $data_random: des nombres de 1 à 500 mélangés ;
  * $data_nearly_sorted: des nombres de 1 à 500 mélangés par tranche de 10 ;
  * $data_reversed: des nombres de 500 à 1 ;
  * $data_few_unique: 5 fois les nombres de 100 à 199 mélangés.

Si nécessaire, [./generate_data](ce fichier) donne un set d'exemple.

### Tris

### Tri par insertion
https://fr.wikipedia.org/wiki/Tri_par_insertion

### Tri rapide (Quicksort)
https://fr.wikipedia.org/wiki/Tri_rapide

### Tri à bulles
https://fr.wikipedia.org/wiki/Tri_%C3%A0_bulles

### Tri à peigne
https://fr.wikipedia.org/wiki/Tri_%C3%A0_peigne

### Tri pair-impair
https://fr.wikipedia.org/wiki/Tri_pair-impair

## Contributeurs (langages par ordre alphabétique)
  * [langage](./sort.py) → [@epfl-dojo](https://github.com/epfl-dojo)
  * ...