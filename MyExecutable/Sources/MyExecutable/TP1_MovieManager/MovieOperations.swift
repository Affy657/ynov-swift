func addMovie(title: String, year: Int, rating: Double, genre: String, to movies: inout [Movie]) {
    let newMovie: Movie = (title: title, year: year, rating: rating, genre: genre)
    movies.append(newMovie)
    print("Film ajoute: \(title)")
}

func findMovie(byTitle title: String, in movies: [Movie]) -> Movie? {
    return movies.first { $0.title.lowercased() == title.lowercased() }
}

func filterMovies(_ movies: [Movie], matching criteria: (Movie) -> Bool) -> [Movie] {
    return movies.filter(criteria)
}

func getUniqueGenres(from movies: [Movie]) -> Set<String> {
    return Set(movies.map { $0.genre })
}
