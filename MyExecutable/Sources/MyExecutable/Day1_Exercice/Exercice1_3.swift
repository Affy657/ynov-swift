// Créer un système de gestion d'étudiants :
// 1. Array d'étudiants (tuples nom/note)
// 2. Calculer la moyenne
// 3. Trouver le meilleur étudiant
// 4. Créer un dictionnaire nom -> note
// 5. Afficher les étudiants ayant plus de 12/20

func exercice1_3() {
    let students = [
        ("Alice", 15.5),
        ("Bob", 12.0),
        ("Charlie", 18.0),
        ("Diana", 11.0),
        ("Eve", 14.5)
    ]
    
    // 1. Liste
    print("-- Etudiants --")
    for s in students {
        print("  \(s.0): \(s.1)/20")
    }
    
    // 2. Moyenne
    var total = 0.0
    for s in students { total += s.1 }
    let average = total / Double(students.count)
    print("\nMoyenne: \(average)/20")

    // 3. Meilleur
    if let best = students.max(by: { $0.1 < $1.1 }) {
        print("Meilleur: \(best.0) (\(best.1)/20)")
    }

    // 4. Dictionnaire
    var dict: [String: Double] = [:]
    for s in students { dict[s.0] = s.1 }
    print("\n-- Dictionnaire --")
    print(dict)
    
    // 5. > 12/20
    print("\n-- Plus de 12/20 --")
    for s in students where s.1 > 12 {
        print("  \(s.0): \(s.1)")
    }
}
