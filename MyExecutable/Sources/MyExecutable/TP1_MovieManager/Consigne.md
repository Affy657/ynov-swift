TP1 - Système de Gestion de Films
Durée estimée: 90 minutes
Concepts couverts: Variables, Collections, Fonctions, Closures, Map/Filter/Reduce
Objectifs Pédagogiques
À la fin de ce TP, vous serez capable de :

Manipuler les collections Swift (Array, Dictionary, Set)
Créer et utiliser des fonctions avec différents types de paramètres
Utiliser les closures pour filtrer et transformer des données
Appliquer les opérations fonctionnelles (map, filter, reduce)
Gérer les optionals de manière sécurisée
Configuration
Réalisez ce TP dans un package SPM exécutable.

Rendu : URL du repository GitHub.

Contexte
Vous allez créer un système de gestion de films en ligne de commande. Ce système permettra de stocker des films, de les rechercher, de les filtrer par genre, et de calculer des statistiques.

Structure d'un film (tuple) :

(title: String, year: Int, rating: Double, genre: String)

Partie 1 : Initialisation et Fonctions de Base
Exercice 1.1 : Créer la base de données de films
Créez un tableau movies contenant au moins 10 films avec des tuples nommés.

Critères :

Titre du film
Année de sortie
Note sur 10
Genre (Action, Drama, Comedy, Sci-Fi, Horror, etc.)
Exemple :

var movies: [(title: String, year: Int, rating: Double, genre: String)] = [
    (title: "Inception", year: 2010, rating: 8.8, genre: "Sci-Fi"),
    // ... Ajoutez au moins 9 autres films
]

💡 Indice : Variez les genres et les années pour pouvoir tester vos filtres plus tard.

Exercice 1.2 : Fonction d'affichage
Créez une fonction displayMovie qui prend un tuple film en paramètre et l'affiche de manière formatée.

Signature :

func displayMovie(_ movie: (title: String, year: Int, rating: Double, genre: String))

Format attendu :

📽️  Inception (2010) - Sci-Fi
⭐ Rating: 8.8/10

💡 Indice : Utilisez l'interpolation de chaînes avec \() et les emojis pour rendre l'affichage attrayant.

Exercice 1.3 : Fonction d'ajout de film
Créez une fonction addMovie qui ajoute un film au tableau movies.

Signature :

func addMovie(title: String, year: Int, rating: Double, genre: String, to movies: inout [(title: String, year: Int, rating: Double, genre: String)])

Testez votre fonction :

addMovie(title: "The Matrix", year: 1999, rating: 8.7, genre: "Sci-Fi", to: &movies)

💡 Indice : Utilisez le paramètre inout pour modifier le tableau d'origine avec &.

Partie 2 : Recherche et Filtrage
Exercice 2.1 : Rechercher un film par titre
Créez une fonction findMovie qui recherche un film par son titre (insensible à la casse).

Signature :

func findMovie(byTitle title: String, in movies: [(title: String, year: Int, rating: Double, genre: String)]) -> (title: String, year: Int, rating: Double, genre: String)?

Exemple d'utilisation :

if let movie = findMovie(byTitle: "inception", in: movies) {
    displayMovie(movie)
} else {
    print("Film non trouvé")
}

💡 Indice : Utilisez la méthode .lowercased() pour comparer les titres en minuscules. La fonction retourne un Optional car le film peut ne pas exister.

Exercice 2.2 : Filtrer par genre avec closure
Créez une fonction filterMovies qui filtre les films selon un critère personnalisé passé en closure.

Signature :

func filterMovies(_ movies: [(title: String, year: Int, rating: Double, genre: String)], matching criteria: ((title: String, year: Int, rating: Double, genre: String)) -> Bool) -> [(title: String, year: Int, rating: Double, genre: String)]

Exemple d'utilisation :

let sciFiMovies = filterMovies(movies) { $0.genre == "Sci-Fi" }
let recentMovies = filterMovies(movies) { $0.year >= 2015 }
let topRated = filterMovies(movies) { $0.rating >= 8.0 }

💡 Indice : Utilisez simplement la méthode .filter() sur le tableau avec la closure fournie.

Exercice 2.3 : Obtenir tous les genres uniques
Créez une fonction getUniqueGenres qui retourne un Set contenant tous les genres présents dans la base de données.

Signature :

func getUniqueGenres(from movies: [(title: String, year: Int, rating: Double, genre: String)]) -> Set<String>

💡 Indice : Utilisez .map() pour extraire les genres, puis convertissez en Set pour éliminer les doublons.

Partie 3 : Statistiques et Opérations Fonctionnelles (25 min)
Exercice 3.1 : Calculer la note moyenne
Créez une fonction averageRating qui calcule la note moyenne de tous les films.

Signature :

func averageRating(of movies: [(title: String, year: Int, rating: Double, genre: String)]) -> Double

💡 Indice : Utilisez .map() pour extraire les notes, puis .reduce() pour les additionner, et divisez par le nombre de films.

Exercice 3.2 : Trouver le meilleur film
Créez une fonction bestMovie qui retourne le film avec la meilleure note.

Signature :

func bestMovie(in movies: [(title: String, year: Int, rating: Double, genre: String)]) -> (title: String, year: Int, rating: Double, genre: String)?

💡 Indice : Utilisez la méthode .max() avec une closure de comparaison sur les ratings.

Exercice 3.3 : Films par décennie
Créez une fonction moviesByDecade qui retourne un dictionnaire groupant les films par décennie.

Signature :

func moviesByDecade(_ movies: [(title: String, year: Int, rating: Double, genre: String)]) -> [String: [(title: String, year: Int, rating: Double, genre: String)]]

Exemple de sortie :

[
    "1990s": [...],
    "2000s": [...],
    "2010s": [...]
]

💡 Indice : Pour calculer la décennie : "\(year / 10 * 10)s". Utilisez une boucle for ou .reduce() pour construire le dictionnaire.

Partie 4 : Menu Interactif
Exercice 4.1 : Créer un menu en ligne de commande
Créez une fonction displayMenu qui affiche les options disponibles, et une fonction runApp qui gère la boucle principale de l'application.

Menu proposé :

=== 🎬 Movie Manager ===
1. Afficher tous les films
2. Rechercher un film
3. Filtrer par genre
4. Afficher les statistiques
5. Ajouter un film
6. Quitter

Fonctionnalités à implémenter :

Option 1 : Affiche tous les films avec displayMovie
Option 2 : Demande un titre et recherche le film
Option 3 : Affiche les genres disponibles et filtre
Option 4 : Affiche nombre total, note moyenne, meilleur film
Option 5 : Demande les informations et ajoute un film
Option 6 : Quitte l'application
💡 Indice : Utilisez readLine() pour lire les entrées utilisateur, et un while avec un booléen pour la boucle principale. Utilisez switch pour gérer les différentes options.

Critères d'Évaluation
Critère	Points
Partie 1 : Initialisation et fonctions de base	5 pts
Partie 2 : Recherche et filtrage	5 pts
Partie 3 : Statistiques et opérations fonctionnelles	5 pts
Partie 4 : Menu interactif	5 pts
Total	20 pts
Conseils
Testez au fur et à mesure : Ne passez pas à l'exercice suivant sans avoir testé le précédent
Utilisez les optionals : Toujours gérer les cas nil avec if let ou guard let