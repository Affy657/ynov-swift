import Foundation

enum Suit: String, CaseIterable {
    case hearts = "♥️"
    case diamonds = "♦️"
    case clubs = "♣️"
    case spades = "♠️"
}

enum Rank: Int, CaseIterable, Comparable {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var name: String {
        switch self {
        case .two:   return "2"
        case .three: return "3"
        case .four:  return "4"
        case .five:  return "5"
        case .six:   return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine:  return "9"
        case .ten:   return "10"
        case .jack:  return "Jack"
        case .queen: return "Queen"
        case .king:  return "King"
        case .ace:   return "Ace"
        }
    }
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

struct Card: Comparable {
    let rank: Rank
    let suit: Suit
    
    var description: String {
        "\(rank.name) of \(suit.rawValue)"
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        lhs.rank < rhs.rank
    }
}

extension Array where Element == Card {
    func highest() -> Card? {
        self.max()
    }
    
    func lowest() -> Card? {
        self.min()
    }
    
    var cardsDescription: String {
        guard !isEmpty else { return "No cards" }
        return map { $0.description }.joined(separator: ", ")
    }
    
    func sortedByRank() -> [Card] {
        sorted { $0.rank < $1.rank }
    }
    
    func sortedByRankDescending() -> [Card] {
        sorted { $0.rank > $1.rank }
    }
}
