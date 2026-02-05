// Créer un système de paiement :
// 1. Protocol PaymentMethod avec total(for amount:) -> Double
// 2. Struct CreditCard (2% frais)
// 3. Struct Cash (pas de frais)
// 4. Fonction processPayment(amount:method:)

protocol PaymentMethod {
    func total(for amount: Double) -> Double
}

struct CreditCard: PaymentMethod {
    func total(for amount: Double) -> Double {
        return amount * 1.02
    }
}

struct Cash: PaymentMethod {
    func total(for amount: Double) -> Double {
        return amount
    }
}

func processPayment(amount: Double, method: PaymentMethod) {
    let total = method.total(for: amount)
    print("Payment of \(amount) with \(method) is \(total)€")
}

func exercice2_3() {
    processPayment(amount: 100, method: CreditCard() )
    processPayment(amount: 100, method: Cash() )
}
