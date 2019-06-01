//
//  Game.swift
//  Jogo da Memoria
//
//  Created by Bruno Klein on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Game {
    
    var cards: [Card] = []
    
    var indexOfSelectedCard: Int?
    
    func chooseCard(at index: Int) {
        if cards.indices.contains(index),
            !cards[index].isMatched {
            
            if let matchedIndex = self.indexOfSelectedCard,
                index != matchedIndex {
                
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = cards[flipDownIndex].isMatched
                }
                
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for index in 0..<numberOfPairOfCards {
            let card = Card(identifier: index)
            
            self.cards += [card, card]
        }
        
        self.cards.shuffle()
    }
    
}

struct Card {
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    var cardState: CardStatus {
        if isMatched {
            return .matched
        } else if isFaceUp {
            return .front
        } else {
            return .back
        }
    }

    init(identifier: Int) {
        self.identifier = identifier
    }
}

enum CardStatus {
    case back, front, matched
}
