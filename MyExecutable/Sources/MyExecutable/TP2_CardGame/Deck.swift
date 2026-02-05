import Foundation

final class Deck {
    private(set) var cards: [Card]
    
    var count: Int { cards.count }
    var isEmpty: Bool { cards.isEmpty }
    
    init() {
        cards = []
        reset()
    }
    
    func reset() {
        cards = Suit.allCases.flatMap { suit in
            Rank.allCases.map { rank in
                Card(rank: rank, suit: suit)
            }
        }
        shuffle()
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func draw() -> Card? {
        guard !isEmpty else { return nil }
        return cards.removeFirst()
    }
    
    func draw(count: Int) -> [Card] {
        var drawnCards: [Card] = []
        for _ in 0..<count {
            guard let card = draw() else { break }
            drawnCards.append(card)
        }
        return drawnCards
    }
}
