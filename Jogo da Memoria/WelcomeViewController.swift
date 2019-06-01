//
//  WelcomeViewController.swift
//  Jogo da Memoria
//
//  Created by Bruno Klein on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    private let gameSegue = "show-game"
    
    var cardTextProvider: CardTextProvider?
    
    @IBAction func touchAnimals(_ sender: Any) {
        self.cardTextProvider = CuteAnimalsEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    @IBAction func touchTech(_ sender: Any) {
        self.cardTextProvider = TechEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameViewController {
            destination.cardTextProvider = self.cardTextProvider        }
        
    }
}
