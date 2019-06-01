//
//  ViewController.swift
//  Jogo da Memoria
//
//  Created by Bruno Klein on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    private let winSegue = "win-game"
    
    lazy var game = Game(numberOfPairOfCards: buttonsArray.count / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var buttonsArray: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var  cardTextProvider: CardTextProvider!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber: Int = buttonsArray.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            self.updateViewFromModel()
            
            flipCount += 1
        }
    }
    
    func updateViewFromModel() {
        for index in game.cards.indices {
            let button = self.buttonsArray[index]
            let card = self.game.cards[index]
            
            switch card.cardState {
                case .front:
                    button.backgroundColor = .white
                    button.setTitle(self.cardTextProvider.text(for: card.identifier), for: .normal)
                case .back:
                    button.backgroundColor = .orange
                    button.setTitle("", for: .normal)
                case .matched:
                    button.backgroundColor = .clear
                    button.setTitle("", for: .normal)
                    button.isEnabled = false
            }
        }
        
        if game.cards.allSatisfy({ (Card) -> Bool in
            Card.isMatched
        }) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.performSegue(withIdentifier: self.winSegue, sender: nil)
            }
        }
    }
    
}
