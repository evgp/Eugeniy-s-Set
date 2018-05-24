//
//  SetModel.swift
//  Eugeniy's Set
//
//  Created by Evgeniy Polyarush on 21/05/2018.
//  Copyright © 2018 Evgeniy Polyarush. All rights reserved.
//

import Foundation

struct gameSet {
    var cards = [Card]()
    var cardField = [Int:Card]()
    
    mutating func chooseCard(at index: Int) {
        let selected = cardField[index]?.isSelected
        cardField[index]?.isSelected = !selected!
        
//        cardField.forEach() {
//            $0.key
//        }
    }
    
    
    init () {
        for num in 1...3 {
            for sym in 1...3 {
                for sha in 1...3 {
                    for col in 1...3 {
                        cards += [Card(number: num, symbol: sym, shading: sha, color: col, isSelected: false, isSet: false)]
                    }
                }
            }
        }
    }

}

