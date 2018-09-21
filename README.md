<b>Travail en cours !</b>

Contributions, commentaires et autres propositions d'améliorations bienvenues !

# TODO
 * Trouver un moyen de générer les résultats: cela implique que chaque utilisateur puisse lancer, sur son propre ordinateur, un jeu de test dans chaque language proposé. → docker ?
 * Trouver un moyen de comparer les résultats: comment rapporter les résultats de test qu'un utilisateur aura fait, sur sa machine, pour chaque langage ?
 * Trouver un moyen de générer les données de départ avant les tests, e.g. pour avoir de plus gros tableau, ou de multiplier les tests.
 * Selectionner quelques algorithmes, par exemple 4.
 * Documenter les algorithmes sélectionnés.

---

# Kata Sort
Le but de ce kata est d'explorer différents algorithmes de tri.

## Documentation / Liens
  * La page Wikipédia: https://fr.wikipedia.org/wiki/Algorithme_de_tri
  * Explications et gif animés:
    * https://web.archive.org/web/20150309073910/http://www.sorting-algorithms.com:80/reversed-initial-order
    * https://www.toptal.com/developers/sorting-algorithms
  * 24 algorithmes de tri visualisés: https://www.youtube.com/watch?v=BeoCbJPuvSE
  * Bubble Sort dance: https://www.youtube.com/watch?v=lyZQPjUT5B4
  * Donnée de test (Open Data):
    * https://opendata.stackexchange.com/questions/5737/series-of-integers-to-test-sorting-algorithms
    * https://en.m.wikipedia.org/wiki/A_Million_Random_Digits_with_100,000_Normal_Deviates
  * http://sortbenchmark.org/ / http://www.ordinal.com/gensort.html
  * Analysis and Testing of Sorting Algorithms on a Standard Dataset: https://ieeexplore.ieee.org/document/7280062/

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
[./generate_data.sh](generate_data.sh), stoqués dans le fichier
[generated_data.json](generated_data.json). Les tableaux sont nommés de la
manière suivante (pour un appel `./generate_data.sh 500`) :
  * `data_random` : des nombres de 1 à 500 mélangés ;
  * `data_nearly_sorted` : des nombres de 1 à 500 mélangés par tranche de 10 ;
  * `data_reversed` : des nombres de 500 à 1 ;
  * `data_few_unique` : 5 fois les nombres de 100 à 199 mélangés.

## Tris

### Tri par insertion
En informatique, le tri par insertion est un algorithme de tri classique. La
plupart des personnes l'utilisent naturellement pour trier des cartes à jouer.
 → https://fr.wikipedia.org/wiki/Tri_par_insertion

### Tri rapide (Quicksort)
Le tri rapide (en anglais quicksort) est un algorithme de tri inventé par C.A.R.
Hoare en 1961 et fondé sur la méthode de conception diviser pour régner. Il est
généralement utilisé sur des tableaux, mais peut aussi être adapté aux listes.
 → https://fr.wikipedia.org/wiki/Tri_rapide

### Tri à bulles (Bubble sort)
Le tri à bulles ou tri par propagation est un algorithme de tri. Il consiste à
comparer répétitivement les éléments consécutifs d'un tableau, et à les permuter
lorsqu'ils sont mal triés. Il doit son nom au fait qu'il déplace rapidement les
plus grands éléments en fin de tableau, comme des bulles d'air qui remonteraient
rapidement à la surface d'un liquide.
 → https://fr.wikipedia.org/wiki/Tri_%C3%A0_bulles

### Tri à peigne (Comb sort)
Le comb sort ou tri à peigne ou tri de Dobosiewicz est un algorithme de tri
assez simple initialement inventé par Wodzimierz Dobosiewicz en 1980. Le comb
sort améliore notablement les performances du tri à bulles, et peut rivaliser
avec des algorithmes de tri réputés rapides comme le tri rapide (quick sort), le
tri fusion (merge sort) ou le tri de Shell (Shell sort).
 → https://fr.wikipedia.org/wiki/Tri_%C3%A0_peigne

### Tri pair-impair (Odd–even sort)
Le tri pair-impair opère en comparant tous les couples d'éléments aux positions
paires et impaires consécutives dans une liste et, si un couple est dans le
mauvais ordre (le premier élément est supérieur au second), il en échange les
deux éléments.
 → https://fr.wikipedia.org/wiki/Tri_pair-impair

### Tri stupide (bogosort)
Le tri stupide consiste à vérifier si les éléments sont ordonnés et s'ils ne le
sont pas à mélanger aléatoirement les éléments, puis à répéter l'opération.
 → https://fr.wikipedia.org/wiki/Tri_stupide

## Contributeurs (langages par ordre alphabétique)
  * [langage](./sort.py) → [@epfl-dojo](https://github.com/epfl-dojo)
  * ... 
