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
    var cardField = [Card]()
//        didSet {
//
//        }
    
    var score = 0
    private var choosenCards = [Card]()
    
    mutating func chooseCard(at index: Int) {
        if (choosenCards.count >= 2) {
            choosenCards.append(cardField[index])
            if  compareCards(choosenCards)  {
                choosenCards.forEach() {
                    let cardIndex = cardField.index(of: $0)!
                    cardField[cardIndex].isSet = true
                    cardField[cardIndex].isSelected = false
//                    cardField.remove(at: cardIndex)
                }
                score += 1
            } else {
                choosenCards.forEach() {
                    let cardIndex = cardField.index(of: $0)!
                    cardField[cardIndex].isSelected = false
                }
            }
            choosenCards.removeAll()
        } else {
            if (cardField[index].isSelected) {
                cardField[index].isSelected = false
                let cardIndex = choosenCards.index(of: cardField[index])!
                choosenCards.remove(at: cardIndex)
            } else {
                choosenCards.append(cardField[index])
                cardField[index].isSelected = true
            }
        }
    }
    
    private func compareCards(_ choosenCards: Array<Card>) -> Bool {
        if choosenCards.count > 3 { exit(-1) }
        if  Card.isSet(choosenCards[1], choosenCards[2]) && Card.isSet(choosenCards[0], choosenCards[1]) && Card.isSet(choosenCards[0], choosenCards[2]) {
            return true
        } else { return false }
        
    }
    
    init () {
        for num in 1...3 {
            for sym in 1...3 {
                for sha in 1...3 {
                    for col in 1...3 {
                        cards += [Card(num, sym, sha, col, false, false)]
                    }
                }
            }
        }
    }

}

