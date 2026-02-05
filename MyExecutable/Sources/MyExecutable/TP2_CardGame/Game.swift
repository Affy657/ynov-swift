import Foundation

final class Game {
    private enum Constants {
        static let cardsForWar = 4
        static let hiddenCardsInWar = 3
    }
    
    private let player1: Player
    private let player2: Player
    private let deck: Deck
    private var roundNumber: Int = 0
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.deck = Deck()
    }
    
    func play() {
        dealCards()
        playAllRounds()
        displayFinalResults()
    }
    
    private func dealCards() {
        print("Dealing cards...")
        
        var currentPlayer = player1
        while let card = deck.draw() {
            currentPlayer.receiveCard(card)
            currentPlayer = (currentPlayer === player1) ? player2 : player1
        }
        
        print("\(player1.name) received \(player1.hand.count) cards")
        print("\(player2.name) received \(player2.hand.count) cards\n")
    }
    
    private func playAllRounds() {
        while !player1.hand.isEmpty && !player2.hand.isEmpty {
            playRound()
        }
    }
    
    private func playRound() {
        roundNumber += 1
        print("--- Round \(roundNumber) ---")
        
        guard let card1 = player1.playCard(),
              let card2 = player2.playCard() else { return }
        
        displayPlayedCards(card1: card1, card2: card2)
        resolveRound(card1: card1, card2: card2)
        displayScore()
    }
    
    private func resolveRound(card1: Card, card2: Card) {
        if card1 > card2 {
            awardPoint(to: player1, message: "\(player1.name) wins this round!")
        } else if card1 < card2 {
            awardPoint(to: player2, message: "\(player2.name) wins this round!")
        } else {
            handleWar()
        }
    }
    
    private func awardPoint(to player: Player, message: String) {
        player.score += 1
        print(message)
    }
    
    private func handleWar() {
        print("War! Each player plays 3 cards...")
        
        if !player1.hasEnoughCards(Constants.cardsForWar) {
            print("\(player1.name) doesn't have enough cards for war!")
            awardPoint(to: player2, message: "\(player2.name) wins the war by default!")
            return
        }
        
        if !player2.hasEnoughCards(Constants.cardsForWar) {
            print("\(player2.name) doesn't have enough cards for war!")
            awardPoint(to: player1, message: "\(player1.name) wins the war by default!")
            return
        }
        
        playWarRound()
    }
    
    private func playWarRound() {
        for _ in 0..<Constants.hiddenCardsInWar {
            _ = player1.playCard()
            _ = player2.playCard()
        }
        
        guard let warCard1 = player1.playCard(),
              let warCard2 = player2.playCard() else { return }
        
        displayPlayedCards(card1: warCard1, card2: warCard2)
        
        if warCard1 > warCard2 {
            awardPoint(to: player1, message: "\(player1.name) wins the war!")
        } else if warCard1 < warCard2 {
            awardPoint(to: player2, message: "\(player2.name) wins the war!")
        } else {
            print("Another tie! War continues...")
            handleWar()
        }
    }
    
    private func displayPlayedCards(card1: Card, card2: Card) {
        print("\(player1.name) plays: \(card1.description)")
        print("\(player2.name) plays: \(card2.description)")
    }
    
    private func displayScore() {
        print("Score: \(player1.name) \(player1.score) - \(player2.name) \(player2.score)\n")
    }
    
    private func displayFinalResults() {
        print("=== GAME OVER ===")
        
        if player1.score > player2.score {
            print("Winner: \(player1.name) with \(player1.score) points!")
        } else if player2.score > player1.score {
            print("Winner: \(player2.name) with \(player2.score) points!")
        } else {
            print("It's a tie!")
        }
        
        print("Final score: \(player1.name) \(player1.score) - \(player2.name) \(player2.score)")
    }
}
