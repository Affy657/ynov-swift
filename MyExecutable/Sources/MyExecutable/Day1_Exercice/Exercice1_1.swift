// Créer un programme qui :
// 1. Déclare des variables pour nom, âge, taille (en mètres)
// 2. Calcule l'année de naissance
// 3. Affiche un résumé formaté
// 4. Utilise un optional pour le deuxième prénom et l'affiche s'il existe

func exercice1_1() {
    let name = "Morand"
    let firstName = "Adrien"
    let middleName: String? = nil
    let age = 22
    let height = 1.75
    let year = 2026
    let birthYear = year - age

    print("""
    === Profile ===
    Name: \(name)
    First Name: \(firstName)
    Middle Name: \(middleName ?? "N/A")
    Age: \(age) years old
    Height: \(height) meters
    Birth Year: \(birthYear)
    """)
}
