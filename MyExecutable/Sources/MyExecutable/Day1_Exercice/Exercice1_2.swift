// Créer un programme qui :
// 1. Demande un nombre à l'utilisateur (utiliser readLine())
// 2. Utilise switch pour déterminer si c'est pair/impair
// 3. Affiche les multiples de 3 jusqu'à ce nombre
// 4. Utilise guard pour valider l'entrée

func exercice1_2() {
    print("Entrez un nombre :")
    guard let input = readLine() else {
        print("Entrée invalide")
        return
    }
    guard let number = Int(input) else {
        print("Entrée invalide")
        return
    }
    switch number % 2 {
    case 0:
        print("Le nombre est pair")
    case 1:
        print("Le nombre est impair")
    default:
        print("Le nombre est invalide")
    }
    for i in 0...number {
        if i % 3 == 0 {
            print(i)
        }
    }
}
