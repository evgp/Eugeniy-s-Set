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
    
    
    
    init () {
        for num in 1...3 {
            for sym in 1...3 {
                for sha in 1...3 {
                    for col in 1...3 {
                      let newCard = Card(number: num, symbol: sym, shading: sha, color: col, isSelected: false, isSet: false)
                        cards += [newCard]
                    }
                }
            }
        }
    }
    
}
