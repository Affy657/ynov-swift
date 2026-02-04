func getInput() -> (String, Int, Int)? {
    print("""
    
    == MENU ==
    1. Day (Exercices)
    2. TP (Travaux Pratiques)
    
    """)
    print("Choix: ", terminator: "")
    guard let input = readLine(), let choice = Int(input) else {
        print("Entree invalide")
        return nil
    }
    
    switch choice {
    case 1:
        print("""
        
        -- Days --
        1. Day 1
        2. Day 2
        3. Day 3
        4. Day 4
        
        """)
        print("Day: ", terminator: "")
        guard let dayInput = readLine(), let day = Int(dayInput), day >= 1, day <= 4 else {
            print("Day invalide")
            return nil
        }
        
        print("""
        
        -- Exercices --
        1. Exercice 1
        2. Exercice 2
        3. Exercice 3
        
        """)
        print("Exercice: ", terminator: "")
        guard let exInput = readLine(), let ex = Int(exInput), ex >= 1, ex <= 3 else {
            print("Exercice invalide")
            return nil
        }
        
        return ("day", day, ex)
        
    case 2:
        print("""
        
        -- TPs --
        1. TP1 - Movie Manager
        2. TP2 - Card Game
        3. TP3 - Weather API
        4. TP4 - Pokemon
        
        """)
        print("TP: ", terminator: "")
        guard let tpInput = readLine(), let tp = Int(tpInput), tp >= 1, tp <= 4 else {
            print("TP invalide")
            return nil
        }
        
        return ("tp", tp, 0)
        
    default:
        print("Choix invalide")
        return nil
    }
}

func selectExercise(choice: (String, Int, Int)?) {
    guard let choice = choice else { return }
    
    let (type, num1, num2) = choice
    
    if type == "day" {
        switch (num1, num2) {
        case (1, 1): exercice1_1()
        case (1, 2): exercice1_2()
        case (1, 3): exercice1_3()
        case (2, 1): exercice2_1()
        case (2, 2): exercice2_2()
        case (2, 3): exercice2_3()
        case (3, 1): exercice3_1()
        case (3, 2): exercice3_2()
        case (3, 3): exercice3_3()
        case (4, 1): exercice4_1()
        case (4, 2): exercice4_2()
        case (4, 3): exercice4_3()
        default: print("Exercice invalide")
        }
    } else if type == "tp" {
        switch num1 {
        case 1: tp1_movieManager()
        case 2: tp2_cardGame()
        case 3: tp3_weatherAPI()
        case 4: tp4_pokemon()
        default: print("TP invalide")
        }
    }
}
