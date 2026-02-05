import Foundation

func exportToCSV(_ movies: [Movie]) -> String {
    var csv = "Title,Year,Rating,Genre\n"
    for movie in movies {
        let safeTitle = movie.title.replacingOccurrences(of: ",", with: ";")
        csv += "\(safeTitle),\(movie.year),\(movie.rating),\(movie.genre)\n"
    }
    return csv
}

func saveCSV(_ movies: [Movie], to filename: String) {
    let csv = exportToCSV(movies)
    let fileManager = FileManager.default
    let currentPath = fileManager.currentDirectoryPath
    let filePath = "\(currentPath)/\(filename)"
    
    do {
        try csv.write(toFile: filePath, atomically: true, encoding: .utf8)
        print("Fichier sauvegarde: \(filePath)")
    } catch {
        print("Erreur lors de la sauvegarde: \(error)")
    }
}
