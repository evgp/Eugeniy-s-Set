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
    var cardField = [Int:Card]()
    var score = 0
    private var choosenCards = [Int:Card]()
    
    mutating func chooseCard(at index: Int) {
        if (choosenCards.count >= 2) && !choosenCards.contains() {$0.key == index} {
            choosenCards[index] = cardField[index]
            if  compareCards(choosenCards)  {
                choosenCards.forEach() {
                    let key = $0.key
                    cardField[key]?.isSet = true
                    cardField[key]?.isSelected = false
                    choosenCards.removeAll()
                }
                score += 1
            } else {
                choosenCards.forEach() {
                    let key = $0.key
                    cardField[key]?.isSelected = false
                    choosenCards.removeAll()
                }
            }
        } else {
            if (cardField[index]?.isSelected)! {
                cardField[index]?.isSelected = false
                choosenCards.removeValue(forKey: index)
            } else {
                choosenCards[index] = cardField[index]
                cardField[index]?.isSelected = true
            }
        }
    }
    
    private func compareCards(_ choosenCards: Dictionary<Int, Card>) -> Bool {
        if choosenCards.count > 3 { exit(-1) }
        var valuesArray = [Card]()
        for (key, _) in choosenCards {
            valuesArray.append(choosenCards[key]!)
        }
        if  (valuesArray[1] == valuesArray[2]) && (valuesArray[0] == valuesArray[1]) && ((valuesArray[0] == valuesArray[2])) {
            return true
        } else { return false }
        
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

