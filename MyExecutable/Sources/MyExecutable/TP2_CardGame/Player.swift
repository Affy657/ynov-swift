import Foundation

protocol Player: AnyObject {
    var name: String { get }
    var hand: [Card] { get set }
    var score: Int { get set }
    
    func playCard() -> Card?
    func receiveCard(_ card: Card)
    func receiveCards(_ cards: [Card])
    func hasEnoughCards(_ count: Int) -> Bool
}

extension Player {
    func playCard() -> Card? {
        guard !hand.isEmpty else { return nil }
        return hand.removeFirst()
    }
    
    func receiveCard(_ card: Card) {
        hand.append(card)
    }
    
    func receiveCards(_ cards: [Card]) {
        hand.append(contentsOf: cards)
    }
    
    func hasEnoughCards(_ count: Int) -> Bool {
        hand.count >= count
    }
}

final class HumanPlayer: Player {
    let name: String
    var hand: [Card]
    var score: Int
    
    init(name: String) {
        self.name = name
        self.hand = []
        self.score = 0
    }
}

final class AIPlayer: Player {
    let name: String
    var hand: [Card]
    var score: Int
    
    init(name: String) {
        self.name = name
        self.hand = []
        self.score = 0
    }
}
