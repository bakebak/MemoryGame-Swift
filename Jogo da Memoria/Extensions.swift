//
//  Extensions.swift
//  Jogo da Memoria
//
//  Created by Bruno Klein on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension Bool {
    mutating func toggle() {
        self = !self
    }
}

extension Array {
    mutating func removeRandom() -> Element {
        let index = Int.random(in: self.indices)
        
        return self.remove(at: index)
    }
}
