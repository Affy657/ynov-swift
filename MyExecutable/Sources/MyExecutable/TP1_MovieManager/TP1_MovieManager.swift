func tp1_movieManager() {
    var movies: [Movie] = [
        (title: "Inception", year: 2010, rating: 8.8, genre: "Sci-Fi"),
        (title: "The Dark Knight", year: 2008, rating: 9.0, genre: "Action"),
        (title: "Pulp Fiction", year: 1994, rating: 8.9, genre: "Drama"),
        (title: "The Shawshank Redemption", year: 1994, rating: 9.3, genre: "Drama"),
        (title: "Interstellar", year: 2014, rating: 8.6, genre: "Sci-Fi"),
        (title: "The Hangover", year: 2009, rating: 7.7, genre: "Comedy"),
        (title: "Get Out", year: 2017, rating: 7.7, genre: "Horror"),
        (title: "Avengers: Endgame", year: 2019, rating: 8.4, genre: "Action"),
        (title: "Parasite", year: 2019, rating: 8.5, genre: "Drama"),
        (title: "The Matrix", year: 1999, rating: 8.7, genre: "Sci-Fi")
    ]
    
    var running = true
    
    while running {
        displayMovieMenu()
        print("Choix: ", terminator: "")
        
        guard let input = readLine(), let choice = Int(input) else {
            print("Entree invalide")
            continue
        }
        
        switch choice {
        case 1:
            print("\n-- Tous les films --")
            for movie in movies {
                displayMovie(movie)
            }
            
        case 2:
            print("Titre a rechercher: ", terminator: "")
            if let title = readLine() {
                if let movie = findMovie(byTitle: title, in: movies) {
                    print("")
                    displayMovie(movie)
                } else {
                    print("Film non trouve")
                }
            }
            
        case 3:
            let genres = getUniqueGenres(from: movies)
            print("Genres disponibles: \(genres.joined(separator: ", "))")
            print("Genre a filtrer: ", terminator: "")
            if let genre = readLine() {
                let filtered = filterMovies(movies) { $0.genre.lowercased() == genre.lowercased() }
                if filtered.isEmpty {
                    print("Aucun film trouve")
                } else {
                    print("")
                    for movie in filtered {
                        displayMovie(movie)
                    }
                }
            }
            
        case 4:
            print("\n-- Statistiques --")
            print("Nombre de films: \(movies.count)")
            print("Note moyenne: \(averageRating(of: movies))/10")
            if let best = bestMovie(in: movies) {
                print("Meilleur film: \(best.title) (\(best.rating)/10)")
            }
            print("\nFilms par decennie:")
            let decades = moviesByDecade(movies)
            for (decade, films) in decades.sorted(by: { $0.key < $1.key }) {
                print("  \(decade): \(films.count) films")
            }
            
        case 5:
            print("Titre: ", terminator: "")
            guard let title = readLine(), !title.isEmpty else {
                print("Titre invalide")
                continue
            }
            print("Annee: ", terminator: "")
            guard let yearStr = readLine(), let year = Int(yearStr) else {
                print("Annee invalide")
                continue
            }
            print("Note (0-10): ", terminator: "")
            guard let ratingStr = readLine(), let rating = Double(ratingStr) else {
                print("Note invalide")
                continue
            }
            print("Genre: ", terminator: "")
            guard let genre = readLine(), !genre.isEmpty else {
                print("Genre invalide")
                continue
            }
            addMovie(title: title, year: year, rating: rating, genre: genre, to: &movies)
            
        case 6:
            print("\n-- Export CSV --")
            let csv = exportToCSV(movies)
            print(csv)
            print("Nom du fichier (ou vide pour annuler): ", terminator: "")
            if let filename = readLine(), !filename.isEmpty {
                saveCSV(movies, to: filename)
            }
            
        case 7:
            print("Au revoir!")
            running = false
            
        default:
            print("Choix invalide")
        }
    }
}
