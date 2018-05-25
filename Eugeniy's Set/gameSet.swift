//
//  SetModel.swift
//  Eugeniy's Set
//
//  Created by Evgeniy Polyarush on 21/05/2018.
//  Copyright © 2018 Evgeniy Polyarush. All rights reserved.
//

//A set consists of three cards satisfying all of these conditions:
//
//They all have the same number or have three different numbers.
//They all have the same symbol or have three different symbols.
//They all have the same shading or have three different shadings.
//They all have the same color or have three different colors.

import Foundation

struct gameSet {
    var cards = [Card]()
    private var cardField = [Int:Card]()
    private var choosenCards = [Card]()
    
    mutating func chooseCard(at index: Int) {
        let selected = cardField[index]?.isSelected
        cardField[index]?.isSelected = !selected!
        
        

    }
    
//    func isSet(_ card1: Card,_ card2: Card,_ card3: Card) -> Bool {
//        if ((card1.color == card2.color == card3.color) &
//            (card1.number != card2.number != card3.number) &
//            (card1.shading != card2.shading != card3.shading) &
//            (card1.symbol != card2.symbol != card3.symbol)) or
//            
//        {
//            
//        }
//        
//        
//        
//        return false
//    }
    
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

