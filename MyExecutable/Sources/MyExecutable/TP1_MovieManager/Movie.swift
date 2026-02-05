typealias Movie = (title: String, year: Int, rating: Double, genre: String)

func displayMovie(_ movie: Movie) {
    print("  \(movie.title) (\(movie.year)) - \(movie.genre)")
    print("  Rating: \(movie.rating)/10")
    print("")
}

func displayMovieMenu() {
    print("""
    
    === Movie Manager ===
    1. Afficher tous les films
    2. Rechercher un film
    3. Filtrer par genre
    4. Afficher les statistiques
    5. Ajouter un film
    6. Exporter en CSV
    7. Quitter
    
    """)
}
