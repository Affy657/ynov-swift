func averageRating(of movies: [Movie]) -> Double {
    guard !movies.isEmpty else { return 0.0 }
    let total = movies.map { $0.rating }.reduce(0, +)
    return total / Double(movies.count)
}

func bestMovie(in movies: [Movie]) -> Movie? {
    return movies.max { $0.rating < $1.rating }
}

func moviesByDecade(_ movies: [Movie]) -> [String: [Movie]] {
    var result: [String: [Movie]] = [:]
    for movie in movies {
        let decade = "\(movie.year / 10 * 10)s"
        if result[decade] == nil {
            result[decade] = []
        }
        result[decade]?.append(movie)
    }
    return result
}
