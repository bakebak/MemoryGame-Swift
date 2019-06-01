//
//  WinGameViewController.swift
//  Jogo da Memoria
//
//  Created by Bruno Klein on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class WinGameViewController: UIViewController {

    
    @IBAction func touchPlayAgain(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
